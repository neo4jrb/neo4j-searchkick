# Neo4j::Searchkick

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

At the moment, this gem is not built with Neo4j performance in mind. ActiveRel's queries are not using parameters and as a result, you may take a performance 
hit if using this in a busy production environment. Please see Github issues or contact Chris if you'd like to help or an update on the status.

TODO:

* Tests would be nice.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/neo4j-searchkick/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
