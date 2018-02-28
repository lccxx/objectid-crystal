# objectid-crystal

simple implement mongodb bson objectid

The 12-byte ObjectId value consists of:

* a 4-byte value representing the seconds since the Unix epoch,
* a 3-byte machine identifier,
* a 2-byte process id, and
* a 3-byte counter, starting with a random value.

see: https://docs.mongodb.com/manual/reference/method/ObjectId

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

ObjectId.new 16  # base 16

ObjectId.new 16, Time.now.epoch

ObjectId.new 36, Time.new(2016, 2, 15, 10, 20, 30).epoch
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
