# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  it 'creates an account with subscriptions' do
    expect(@user).to be_valid
  end

  it 'verify present user' do
    expect(@user).to be_present
  end

  it 'verify email user' do
    expect(@user.email).to eq("daviluis323@gmail.com")
  end

  it 'verify password user' do
    expect(@user.password_digest).to eq("dsaqdwqd")
  end

end
