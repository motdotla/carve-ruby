require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'carve'
require 'dotenv'
Dotenv.load

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  config.before(:suite) do
    # FakeWeb.allow_net_connect = false
  end

  # config.after(:suite) do
  #   FakeWeb.allow_net_connect = true
  # end
end

def set_secret_and_public_api_keys!
  Carve.secret_api_key = ENV['CARVE_SECRET_API_KEY']
end
