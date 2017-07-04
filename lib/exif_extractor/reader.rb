require 'exif_extractor/image'

module ExifExtractor
  require 'exifr'

  class Reader
    def self.read(directory)
      filenames = Dir.glob("#{directory}/**/*.{jpg,jpeg,tiff}")
      images = []

      filenames.each do |filename|
        metadata = init_metadata(filename)

        if metadata.exif?
          if metadata.gps == nil
            $logger.info("Image #{filename} didn't have GPS data")
          else
            images << Image.new(filename, metadata.gps.latitude, metadata.gps.longitude)
          end
        else
          $logger.info("Image #{filename} didn't have EXIF data")
        end
      end

      images
    end

    private

    def self.init_metadata(filename)
      if filename.match(/\.jp(e)?g/)
        return EXIFR::JPEG.new(filename)
      else
        return EXIFR::TIFF.new(filename)
      end
    end
  end
end