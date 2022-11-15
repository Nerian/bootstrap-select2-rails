# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bootstrap-select2-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gonzalo Rodríguez-Baltanás Díaz"]
  gem.email         = ["siotopo@gmail.com"]
  gem.description   = %q{Select2 and Bootstrap 5 theme packaged as a Rails engine }
  gem.homepage      = "https://github.com/Nerian/bootstrap-select2-rails"
  gem.summary       = gem.description
  gem.license       = 'MIT'

  gem.name          = "bootstrap-select2-rails"
  gem.require_paths = ["lib"]
  gem.files         = `git ls-files`.split("\n").reject { |i| i=~/testapp/}
  gem.version       = BootstrapSelect2Rails::Rails::VERSION

  gem.add_dependency "railties", ">= 3.0"
  gem.add_development_dependency "bundler", ">= 1.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "json"
  gem.add_development_dependency "thor"
end
