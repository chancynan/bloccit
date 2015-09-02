# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  context "attributes" do
    let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: true)}
    let(:answer) { Answer.create!(body: "Answer Body", question: question)}

    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
