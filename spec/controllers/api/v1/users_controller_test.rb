require 'rails_helper'
RSpec.describe  Api::V1::UsersController do
  describe "Verify User Api" do

    before do
      @user = create(:user)
    end

    it 'responds a 200 response' do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end

    it 'responds a 302 response (not authorized)' do
      post :update,, params: { id: @user.id }
      expect(response).to have_http_status(403)
    end

    it 'responds a 302 response (not authorized)' do
      post :destroy, params: { id: @user.id }
      expect(response).to have_http_status(403)
    end

  end
end
