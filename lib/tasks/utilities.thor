# encoding: utf-8

require 'json'
require 'pry'
require File.expand_path('../../bootstrap-select2-rails/version', __FILE__)

class Utilities < Thor
  include Thor::Actions

  SELECT2_REPO = 'git@github.com:select2/select2.git'
  SELECT2_SRC  = 'select2-src'

  SELECT2_THEME_5_REPO = 'git@github.com:apalfrey/select2-bootstrap-5-theme.git'
  SELECT2_THEME_5_SRC  = 'select2-theme-src'

  desc "update", "Update assets"
  def update
    # Update the select 2 assets
    if !Dir.exist?(SELECT2_SRC)
      run("git clone #{SELECT2_REPO} #{SELECT2_SRC}")
    end
    run("cd #{SELECT2_SRC} && git checkout develop && git pull")

    # Update the select 2 theme assets
    if !Dir.exist?(SELECT2_THEME_5_SRC)
      run("git clone #{SELECT2_THEME_5_REPO} #{SELECT2_THEME_5_SRC}")
    end
    run("cd #{SELECT2_THEME_5_SRC} && git checkout master && git pull")

    # Copy Select 2 assets to our gem
    run("cp #{SELECT2_SRC}/dist/css/select2.css vendor/assets/stylesheets/bootstrap-select2-rails/select2.css")
    run("cp #{SELECT2_SRC}/dist/js/select2.js vendor/assets/javascripts/bootstrap-select2-rails/select2.js")
    run("cp #{SELECT2_SRC}/dist/js/i18n/*.js vendor/assets/javascripts/bootstrap-select2-rails/locales/")

    # Copy Bootstrap theme assets to our gem
    run("cp #{SELECT2_THEME_5_SRC}/src/* vendor/assets/stylesheets/bootstrap-select2-rails/bootstrap5/")

    # Comment out problematic import
    gsub_file('vendor/assets/stylesheets/bootstrap-select2-rails/bootstrap5/select2-bootstrap-5-theme.scss', /^(\s*)([^#\n]*#{'@import "node_modules*'})/, '\1// \2', *args)

    run("git status")

    puts "\n"
    puts "select2 version:                 #{JSON.parse(File.read("./#{SELECT2_SRC}/package.json"))['version']}"
    puts "select2-theme version:           #{JSON.parse(File.read("./#{SELECT2_THEME_5_SRC}/package.json"))['version']}"
    puts "bootstrap-select2-rails version: #{BootstrapSelect2Rails::Rails::VERSION}"
  end

  desc "build", "build the gem"
  def build
    run("gem build bootstrap-select2-rails.gemspec")
  end

  desc "publish", "publish the gem"
  def publish
    tags = `git tag`.split
    current_version = BootstrapSelect2Rails::Rails::VERSION
    run("gem build bootstrap-select2-rails.gemspec")
    run("git tag -a #{current_version} -m 'Release #{current_version}'") unless tags.include?(current_version)
    run("gem push bootstrap-select2-rails-#{current_version}.gem")
    run("git push --follow-tags")
  end
end
