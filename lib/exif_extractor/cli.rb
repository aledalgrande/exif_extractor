require 'thor'
require 'exif_extractor'

module ExifExtractor
  class CLI < Thor
    desc 'extract (<DIR> --output <csv|html>)',
      'Extracts EXIF GPS data from images to CSV or HTML'
    method_option :output, aliases: '-o'
    def extract(directory='.')
      $logger = Logger.new(STDOUT)
      writer_type = options[:output] || 'csv'
      images = Reader.read(directory)
      writer = Writer.new(writer_type).write(images, 'gps_data')
    end
  end
end