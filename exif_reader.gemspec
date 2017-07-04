# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exif_extractor/version'

Gem::Specification.new do |spec|
  spec.name          = "exif_extractor"
  spec.version       = ExifExtractor::VERSION
  spec.authors       = ["Alessandro Dal Grande"]
  spec.email         = ["adgror@gmail.com"]

  spec.summary       = %q{Extracts GPS coordinates from images}
  spec.description   = %q{Command line utility in Ruby that reads all the images in the designated directory, extracts their EXIF GPS data (longitude and latitude), and then writes the name of the image and the coordinates for each image to a CSV or HTML file.}
  spec.homepage      = "https://github.com/aledalgrande/exif_extractor"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "exifr", "~> 1.2", ">= 1.2.6"
  spec.add_dependency "erubis", "~> 2.7.0"

  spec.add_development_dependency "aruba"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
