require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sass'

configure do
  set :haml, { :format => :html5, :layout_engine => :erb }
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

not_found do
  # The HTML5 Boilerplate's 404.html is easier to understand than the default Sinatra 404-message.
  # However, this should probably be changed to some view using your own layout, and your own message.
  File.read(File.join('public', '404.html'))
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"stylesheets/#{params[:name]}"
end

get '/' do
  @title = "Hello world!"
  @descr = "This is a description for search engines and such."
  @body_classes = "oneclass anotherclass"
  haml :index
end