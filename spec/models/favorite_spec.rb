require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  describe 'favoriting a post after creating it' do
    it 'favorites the post after creating it' do
      post :create, { topic_id: @topic.id, post_id: @post.id }
      expect(@user.favorites.where(post: @post)).not_to be_nil
    end
  end
end
