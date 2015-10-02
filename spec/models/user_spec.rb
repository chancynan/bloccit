# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  it { should have_many(:comments)}
  it { should have_many(:votes) }
  it { should validate_presence_of(:name)}
  it { should validate_length_of(:name).is_at_least(1) }

  #Shoulda tests for email

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }

  #Should tests for password
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to role" do
      expect(user).to respond_to(:role)
    end

    it "should respond to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "should respond to member?" do
      expect(user).to respond_to(:member?)
    end
  end

  describe "roles" do
    it "should be member by default" do
      expect(user.role).to eql("member")
    end

    context "member user" do
      it "should return true for #member?" do
        expect(user.member?).to be_truthy
      end

      it "should return false for #admin?" do
        expect(user.admin?).to be_falsey
      end
    end

    context "admin user" do
       before do
         user.admin!
       end

       it "should return false for #member?" do
         expect(user.member?).to be_falsey
       end

       it "should return true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
    let(:user_with_invalid_email_format) { User.new(name: "Bloccit User", email: "invalid_format") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should be an invalid user due to incorrectly formatted email address" do
      expect(user_with_invalid_email_format).to_not be_valid
    end
  end
  describe ".avatar_url" do
     let(:known_user) { create(:user, email: "blochead@bloc.io") }

     it "returns the proper Gravatar url for a known email entity" do
       expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"
       expect(User.avatar_url(known_user, 48)).to eq(expected_gravatar)
     end
   end

end
