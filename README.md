# ExifExtractor

Command line utility in Ruby that reads all the images in the designated directory, extracts their EXIF GPS data (longitude and latitude), and then writes the name of the image and the coordinates for each image to a CSV or HTML file.

## Installation

Install it yourself as:

    $ gem install exif_extractor

If using Rbenv you might need to:

    $ rbenv rehash

## Usage

It is possible to run on the current directory (will output CSV):

    $ exif_extractor extract

Or on a custom directory:

    $ exif_extractor extract ../my_folder/another_folder

Also the output can be customized to CSV or HTML

    $ exif_extractor extract --output csv
    $ exif_extractor extract --output html

The output will always be written to the current directory.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Possible issues

Because of time constraints it was not possible to test all possible GPS formats (see [Wikipedia](https://en.wikipedia.org/wiki/Geotagging#GPS_formats)), so there could be inconsistencies.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aledalgrande/exif_extractor.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

