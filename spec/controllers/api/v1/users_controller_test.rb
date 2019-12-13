require 'rails_helper'
RSpec.describe  Api::V1::UsersController do
  describe "Verify User Api" do

    before do
      @user = create(:user)
    end

    it 'should respond with 200 when get user with id param' do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end

    it 'should respond with 403 when update params are missing' do
      post :update, params: { id: @user.id }
      expect(response).to have_http_status(403)
    end

    it 'should respond with 403 when destroy params are missing' do
      post :destroy, params: { id: @user.id }
      expect(response).to have_http_status(403)
    end

    it 'should return a json get user with correct params' do
      post :create, format: :json, params: { user: { email: 'test@test.org', password: '123456' } }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

  end
end
