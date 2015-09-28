require 'rails_helper'
include RandomData

  RSpec.describe Rating, type: :model do
    let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
    let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
    let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
    let(:label) { Label.create!(name: 'Label') }
    let(:rating) { Rating.create!(severity: 'PG') }
    let(:rating2) { Rating.create!(severity: 'R') }

    it { should belong_to :rateable }
    it { should have_many :rating_associations }
    it { should have_many :topics }
    it { should have_many :posts }

    describe "rateable" do
      it "allows the same rating to be associated with a different topic and post" do
        topic.ratings << rating
        post.ratings << rating

        topic_rating = topic.ratings[0]
        post_rating = post.ratings[0]

        expect(topic_rating).to eql(post_rating)
      end
    end

    describe ".update_ratings" do
      it "takes a comma delimited string and returns an array of Labels" do
        ratings = "#{rating.name}, #{rating2.name}"
        ratings_as_a = [rating, rating2]
# #24
        expect(Rating.update_ratings(ratings)).to eq(ratings_as_a)
      end
    end
  end
