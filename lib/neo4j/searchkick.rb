require "neo4j/searchkick/version"

module Searchkick
  class Results  
    def results
      @results ||= begin
        if options[:load]
          # results can have different types
          results = {}
          hits.group_by{|hit, i| hit["_type"] }.each do |type, grouped_hits|
            records = type.camelize.constantize
            if options[:includes]
              records = records.includes(options[:includes])
            end
            results[type] =
              if records.respond_to?(:primary_key) and records.primary_key
                # ActiveRecord
                records.where(records.primary_key => grouped_hits.map{|hit| hit["_id"] }).to_a
              elsif records.respond_to?(:from_class)
                records.array_load(grouped_hits.map { |hit| hit['_id'].to_i })
              elsif records.respond_to?(:all) and records.all.respond_to?(:for_ids)
                # Mongoid 2
                records.all.for_ids(grouped_hits.map{|hit| hit["_id"] }).to_a
              else
                # Mongoid 3+
                records.queryable.for_ids(grouped_hits.map{|hit| hit["_id"] }).to_a
              end
          end

          # sort
          hits.map do |hit|
            results[hit["_type"]].find{|r| r.id.to_s == hit["_id"].to_s }
          end.compact
        else
          hits.map do |hit|
            result =
              if hit["_source"]
                hit.except("_source").merge(hit["_source"])
              else
                hit.except("fields").merge(hit["fields"])
              end
            result["id"] ||= result["_id"] # needed for legacy reasons
            Hashie::Mash.new(result)
          end
        end
      end
    end
  end
end
