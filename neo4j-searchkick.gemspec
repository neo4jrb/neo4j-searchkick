# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'neo4j/searchkick/version'

Gem::Specification.new do |spec|
  spec.name          = "neo4j-searchkick"
  spec.version       = Neo4j::Searchkick::VERSION
  spec.authors       = ["Chris Grigg"]
  spec.email         = ["chris@subvertallmedia.com"]
  spec.summary       = %q{Provides support for Neo4jrb 3.0 ActiveRel models}
  spec.description   = %q{This gem overrides the Searchkick::Results.result method to provide support for Neo4j relationships.}
  spec.homepage      = "https://github.com/neo4jrb/neo4j-searchkick"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'neo4j', '~> 3.0.1'
  spec.add_dependency 'searchkick'
end
