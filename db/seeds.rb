require_relative "../database"

DB.each_with_index do |post_hash, i|
  post = Post.new
  post.title = post_hash[:title]
  post.content = post_hash[:content]
  post.photo = post_hash[:photo]
  post.save
  COMMENTS[i].each do |string|
    comment = Comment.new()
    comment.post = post
    comment.content = string
    comment.rating = post_hash[:rating]
    comment.save
  end
end
