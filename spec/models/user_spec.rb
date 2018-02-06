require 'rails_helper'

describe User, type: :model do
  context 'attributes' do
    before do
      @user = User.create(name: 'user', email: 'user@gmail.com', password: 'pass', password_confirmation: 'pass')
    end

    it 'has User attributes' do
      expect(@user.id).to_not be nil
      expect(@user.name).to eq 'user'
      expect(@user.email).to eq 'user@gmail.com'
      expect(@user.password_digest).to_not be nil
    end
  end

  context 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should have_secure_password }
  end
end
