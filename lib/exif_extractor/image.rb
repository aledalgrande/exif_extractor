module ExifExtractor
  class Image
    attr_accessor :latitude
    attr_accessor :longitude
    attr_accessor :name

    def initialize(name, latitude, longitude)
      @name = name
      @latitude = latitude
      @longitude = longitude
    end
  end
end