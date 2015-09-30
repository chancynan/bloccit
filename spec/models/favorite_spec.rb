require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  describe 'favoriting a post after creating it' do
    it 'favorites the post after creating it' do
      post :create, { topic_id: @topic.id, post_id: @post.id }
      expect(@user.favorites.where(post: @post).not_to be_nil
    end
  end
end
