require 'rails_helper'
RSpec.describe  Api::V1::UsersController do
  describe "Verify Api" do
    it 'responds successfully' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end
end
