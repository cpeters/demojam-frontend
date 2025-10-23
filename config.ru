require 'bundler'
require 'rack/protection'

Bundler.require

configure do
  set :server, :puma
end

options "*" do
  response.headers["Allow"] = "HEAD,GET"
  response.headers["Access-Control-Allow-Headers"] = "*"
  200
end

require './app'

use Rack::Protection
run Sinatra::Application
