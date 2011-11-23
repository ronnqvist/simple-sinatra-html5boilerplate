require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'sass'

configure do
  set :haml, { :format => :html5 }
  set :haml, :layout_engine => :erb
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :"stylesheets/#{params[:name]}"
end

get '/' do
  @title = "Hello world!"
  @descr = "This is a description for search engines and such."
  haml :index
end