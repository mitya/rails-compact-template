require 'pp'
require 'bundler/inline'

gemfile ENV['BUNDLE'] == 'yes' do
   source 'https://rubygems.org'
   ruby '2.3.0'
   gem 'rails', '4.2.5.1'
   gem 'sqlite3'
   gem 'puma'
   gem 'coffee-rails'
   # gem 'shotgun'
   # gem 'rerun'
   # gem 'rb-fsevent'
end

require 'action_controller/railtie'
require 'action_view/railtie'
require "sprockets/railtie"

class App < Rails::Application
  config.root = File.dirname(__FILE__)
  config.session_store :cookie_store, :key => '_rails_session'
  config.secret_token = 'xxxx'
  config.secret_key_base = 'xxxx'
  config.assets.paths << Rails.root.join("assets")
  config.assets.compile = true
  config.assets.digest = false
  config.eager_load = false

  config.logger = Rails.logger = Logger.new STDOUT
  config.logger.formatter = Class.new do
    def call(severity, time, progname, msg)
      "#{msg}\n"
    end
  end.new
end

Rails.application.initialize!

class ApplicationController < ActionController::Base
  before_action do
    append_view_path File.expand_path 'views'
  end

  def self.controller_path
    '.'
  end
end

require 'sqlite3'
require 'active_record'
DB_PATH = 'db.sqlite3'
ActiveRecord::Base.establish_connection(:adapter  => 'sqlite3', :database => DB_PATH)
