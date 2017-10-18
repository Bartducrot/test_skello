require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "database"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

set :static, true
set :root, File.dirname(__FILE__)
set :public, 'public'

get "/" do
  @database = DB
  erb :index
end
