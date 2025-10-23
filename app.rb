require 'json'
require 'net/http'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yaml'

config_map_path = '/app/config/backend.yaml'
if File.exist?(config_map_path)
  backend_config = YAML.load_file(config_map_path)
  puts "Configmap content: #{backend_config.inspect}"
else
  puts "Missing configmap"
end

get '/' do
  erb :index
end

get '/quote' do
  quote, author = fetch_zenquote
  "<div class='quote'>#{quote}</div><div class='author'>#{author}</div>"
end

def fetch_zenquote
  url = URI('https://zenquotes.io/api/random')
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  # ZenQuotes returns an array with one object
  quote_data = data.first
  quote = quote_data['q']
  author = quote_data['a']

  return quote, author
end
