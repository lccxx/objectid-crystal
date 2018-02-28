# objectid-crystal

simple implement mongodb bson objectid

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  objectid-crystal:
    github: liu-chong/objectid-crystal
```

## Usage

```crystal
require "objectid-crystal"

ObjectId.new

ObjectId.new Time.now.epoch

ObjectId.new Time.new(2016, 2, 15, 10, 20, 30).epoch, 16
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/liu-chong/objectid-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[liu-chong]](https://github.com/liu-chong) Liu Chong - creator, maintainer
