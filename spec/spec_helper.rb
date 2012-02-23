require 'vcr'
require_relative '../lib/worldcat'

VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.stub_with :webmock
  c.filter_sensitive_data("<WSKEY>") { ENV.fetch("WCAPI_KEY") }
end
