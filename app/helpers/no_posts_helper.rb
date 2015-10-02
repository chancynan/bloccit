module NoPosts
  def no_posts(user)
    User.posts.first == nil && User.comments.first == nil
  end
end
