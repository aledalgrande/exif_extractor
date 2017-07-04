module ExifExtractor
  module Writers
    require 'csv'

    class CSVWriter
      def self.write(images, path)
        $logger.info "Writing data to #{path}..."

        CSV.open(path, 'wb') do |csv|
          csv << ['Name', 'Latitude', 'Longitude']

          images.each do |image|
            csv << [image.name, image.latitude, image.longitude]
          end
        end
      end
    end
  end
end