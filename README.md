# Neo4j::Searchkick

## What does it do?

This gem overrides the `Searchkick::Results#result` method to provide support for Neo4j relationship models created using the 
[Neo4j ruby gem](https://github.com/neo4jrb/neo4j) ActiveRel module.

## Should I use it?

If you want to search against a model, `MyActiveRelModel.search(property: value)`, then this will let you do that. But first,  be sure that this is really appropriate. Generally, Neo4j best practices say that if you find yourself wanting to start  searches based on relationship properties, you probably need to create another node. `Neo4j::ActiveRel`'s search capabilities are very basic for this reason.

An obvious limitation of this gem, at the moment, is that it will immediately return relationship objects. Later on, it would 
probably be better if it returned an array of IDs that you could use as part of a Cypher match to further filter your results.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'neo4j-searchkick'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install neo4j-searchkick

## Usage

Use with Searchkick as you would normally. See [Searchkick's documentation](https://github.com/ankane/searchkick) for more information.

TODO:

* Tests would be nice.

## BEWARE!

This gem is under development. Inclusion in your gemfile will use the Neo4j gem from the master branch. That branch is almost always stable but please be aware that this may result in unexpected behavior.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/neo4j-searchkick/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
