include RandomData

  Post.find_or_create_by(title: "Title 1") {|post| post.body = "Body 1"}
  Comment.find_or_create_by(body: "Comment Body 1") {|comment| comment.post = Post.all.sample}

puts "Seed finished"
puts "#{Post.count} posts exist"
puts "#{Comment.count} comments exist"
