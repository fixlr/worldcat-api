require 'spec_helper'

describe Worldcat::Client do
  let(:client) { Worldcat::Client.new(ENV['WCAPI_KEY']) }

  it 'performs searches' do
    VCR.use_cassette('search_hobbits') do
      results = client.search('hobbits')
      results.code.should == 200
      results.should have_key('searchRetrieveResponse')
    end
  end

  it 'finds bibliographic records by oclc number' do
    VCR.use_cassette('find_bibliographic_record_by_oclc') do
      result = client.get_record('50894')
      result.code.should == 200
      result.should have_key('record')
    end
  end

  it 'finds bibliographic records by isbn number' do
    VCR.use_cassette('find_bibliographic_record_by_isbn') do
      result = client.get_record(:isbn => '0395071224')
      result.code.should == 200
      result.should have_key('record')
    end
  end

  it 'finds library locations' do
    VCR.use_cassette('find_library_locations') do
      result = client.get_locations('50894')
      result.code.should == 200
      result.should have_key('holdings')
    end
  end

  it 'finds library catalog urls for a record' do
    VCR.use_cassette('find_catalog_urls') do
      result = client.get_catalog_urls('164801908', 'YGM')
      result.code.should == 200
      result.should have_key('holdings')
    end
  end

  it 'finds formatted citations' do
    VCR.use_cassette('find_citations') do
      result = client.get_citations('50894')
      result.code.should == 200
      result.parsed_response.should_not be_empty
      result.parsed_response.should_not include('Record does not exist')
    end
  end
end
