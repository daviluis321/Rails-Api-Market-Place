require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  before do
    @product = create(:product)
  end

  it 'should respond with 200 when get user with id param' do
    get :show, params: { id: @product.id }
    expect(response).to have_http_status(200)
  end

  it 'should return keys of show get user json' do
    get :show, params: { id: @product.id }   
    json_response = JSON.parse(response.body)   
    expect(json_response.keys).to match_array(["created_at","id","price","published", "title","updated_at","user_id"])    
  end

  it 'should return a json get user with correct params' do
    request.headers['Authorization'] = JsonWebToken.encode(user_id: @product.user_id)
    post :create, format: :json, params: { product: { title: @product.title, price:@product.price}}
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end
end
