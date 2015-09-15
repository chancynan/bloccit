require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: (1..100).to_a.sample) }

  it { should belong_to(:topic) }

  context "attributes" do

    it "should respond to title" do
      expect(my_sponsored_post).to respond_to(:title)
    end

    it "should respond to body" do
      expect(my_sponsored_post).to respond_to(:body)
    end

    it "should respond to price" do
      expect(my_sponsored_post).to respond_to(:price)
    end
  end

end
