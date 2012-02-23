# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'worldcat-api'
  s.version     = '0.1.0'
  s.authors     = ['Nathan Fixler']
  s.email       = 'nathan@fixler.org'
  s.summary     = 'Ruby wrapper for the Worldcat Search API'
  s.description = 'Ruby wrapper for the Worldcat Search API'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency('httparty')

  s.add_development_dependency('rspec')
  s.add_development_dependency('vcr')
  s.add_development_dependency('webmock', '~> 1.7.0')
end
