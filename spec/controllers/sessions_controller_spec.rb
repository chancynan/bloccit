require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let (:my_user) { User.create!(name: "Blochead", email: "blochead@bloc.io", password: "password") }

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST sessions" do
      it "returns http success" do
        post :create, session: {email: my_user.email}
        expect(response).to have_http_status(:success)
      end


      it "initializes a sessions" do
        post :create, session: {email: my_user.email, password: my_user.password}
        expect(assigns(:session)) == my_user.id
      end


      it "does not initialize session due to missing password" do
        post :create, session: {email: my_user.email}
        expect(assigns(:session)).to be_nil
      end

      it "flashes #error with bad email address" do
        post :create, session: {email: "does not exist"}
        expect(flash[:error]).to be_present
      end

      it "renders #new with bad email address" do
        post :create, session: {email: "does not exist"}
        expect(response).to render_template :new
      end

      it "renders the #show view with valid email address" do
        post :create, session: {email: my_user.email}
        expect(response).to render_template :new
      end
    end
end
