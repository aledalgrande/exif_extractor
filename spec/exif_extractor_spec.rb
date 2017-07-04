require 'spec_helper'

RSpec.describe ExifExtractor, type: :aruba, announce_stdout: true, announce_stderr: true do
  it 'extracts EXIF data from the current directory' do
    cd('../../spec/fixtures/gps_images')
    run_simple('exe/exif_extractor extract', fail_on_error: true)
    expect('gps_data.csv').to be_an_existing_file
  end

  it 'extracts EXIF data from the given directory' do
    run_simple(
      'exe/exif_extractor extract ../../spec/fixtures/gps_images',
      fail_on_error: true
    )
    expect('gps_data.csv').to be_an_existing_file
  end

  it 'extracts EXIF data and outputs to CSV' do
    run_simple(
      'exe/exif_extractor extract ../../spec/fixtures/gps_images --output csv',
      fail_on_error: true
    )
    expect('gps_data.csv').to be_an_existing_file
  end

  it 'extracts EXIF data and outputs to CSV by default' do
    run_simple(
      'exe/exif_extractor extract ../../spec/fixtures/gps_images',
      fail_on_error: true
    )
    expect('gps_data.csv').to be_an_existing_file
  end

  it 'extracts EXIF data and outputs to HTML' do
    run_simple(
      'exe/exif_extractor extract ../../spec/fixtures/gps_images --output html',
      fail_on_error: true
    )
    expect('gps_data.html').to be_an_existing_file
  end

  it 'shows the help section' do
    run_simple('exe/exif_extractor --help')
  end
end
