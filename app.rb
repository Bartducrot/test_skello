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
  erb :'post/index'
end

post "/posts/new" do
  @post = Post.new
  @post.title = params["post"]["title"]
  @post.content = params["post"]["content"]
  @post.photo = params["post"]["photo"]
  @post.save
  redirect "/posts/#{@post.id}"
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :'post/show'
end

post "/new_comment" do
  @comment = Comment.new
  @comment.content = params["comment"]["content"]
  @comment.rating = params["comment"]["rating"]
  post_id = params["comment"]["post_id"]
  @comment.post = Post.find(post_id)
  @comment.save
  redirect "/posts/#{post_id}"
end

