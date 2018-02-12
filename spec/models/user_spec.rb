require 'rails_helper'

describe User, type: :model do
  context 'attributes' do
    before do
      @user = User.create(name: 'user', email: 'user@gmail.com', password: 'password', password_confirmation: 'password')
    end

    it 'has User attributes' do
      expect(@user.id).to_not eq nil
      expect(@user.name).to eq 'user'
      expect(@user.email).to eq 'user@gmail.com'
      expect(@user.password_digest).to_not be nil
    end
  end

  context 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should have_secure_password }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:password).is_at_least(8).on(:create) }
  end
end
