# ** CONFIG **

require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative "database"
require_relative "config/application"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

set :views, proc { File.join(root, "app/views") }
set :static, true
set :root, File.dirname(__FILE__)

# # ** Models **
# require './models/post'
# require './models/comment'

# ** ROUTES **
get "/" do
  # @database = DB
  # erb :'index'
  redirect "/posts"
end

get "/posts" do
  @database = Post.all
  erb :'index'

end
