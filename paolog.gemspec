# encoding: utf-8

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'paolog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'paolog'
  s.version     = Paolog::VERSION
  s.authors     = ['Unagi']
  s.email       = ['info@unagi.com.ar']
  s.homepage    = 'https://github.com/dieb/browserlog'
  s.summary     = 'Watch rails logs live on the browser.'
  s.description = 'Paolog is a live web log viewer for rails apps.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.rdoc']

  s.add_dependency 'rails', '>= 4'
end
