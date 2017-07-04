require 'exif_extractor/writers/csv'
require 'exif_extractor/writers/html'

module ExifExtractor
  class Writer
    def initialize(writer_type)
      @writer_type = writer_type
    end

    def write(images, path)
      if @writer_type == 'csv'
        writer = ExifExtractor::Writers::CSVWriter.write(images, "#{path}.csv")
      else
        writer = ExifExtractor::Writers::HTMLWriter.write(images, "#{path}.html")
      end
    end
  end
end