require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let (:new_user_attributes) do
    {
      name: "BlocHead",
      email: "blochead@bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
    }
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
