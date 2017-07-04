module ExifExtractor
  module Writers
    require 'erubis'

    class HTMLWriter
      def self.write(images, path)
        $logger.info "Writing data to #{path}..."
        template = File.read(File.join(File.dirname(__FILE__), 'template.erb.html'))
        eruby = Erubis::Eruby.new(template)
        @images = images
        html = eruby.result(binding())
        File.open(path, 'w') { |f| f.write html }
      end
    end
  end
end