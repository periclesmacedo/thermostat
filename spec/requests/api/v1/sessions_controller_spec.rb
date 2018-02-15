require 'rails_helper'

shared_examples "returns the user's info and token" do
  it "returns the user's info" do
    expect(json.keys).to include('name', 'email')
  end

  it "returns the user's token" do
    expect(json.keys).to include('token')
  end
end

describe Api::V1::SessionsController, type: :request do
  describe '#signup' do
    context 'when the user is valid' do
      before do
        post api_v1_signup_path, params: {name: 'user', email: 'user@gmail.com', password: 'defaultPass',
                        password_confirmation: 'defaultPass'}, as: :json
      end

      include_examples "returns the user's info and token"

      it 'creates a new user' do
        expect(User.count).to eq 1
        expect(User.first.email).to eq 'user@gmail.com'
      end
    end

    context 'when the user is invalid' do
      before do
        post api_v1_signup_path, params: {name: 'user', password: 'defaultPass',
                        password_confirmation: 'defaultPass'}, as: :json
      end

      it 'does not create a new user' do
        expect(User.count).to eq 0
      end

      it 'returns an error message' do
        expect(json.keys).to_not include('name', 'email')
        expect(json['errors']['messages']).to eq ["Email can't be blank"]
        expect(json['errors']['attributes']).to eq({ "email" => ["can't be blank"] })
      end
    end
  end

  describe '#signin' do
    context 'when the login is valid' do
      before do
        user_attrs = attributes_for(:user)
        User.create(user_attrs)
        post api_v1_signin_path, params: user_attrs, as: :json
      end

      include_examples "returns the user's info and token"
    end

    context 'when the login is invalid' do
      before do
        create(:user, email: 'test@gmail.com')
        post api_v1_signin_path, params: {email: 'test@gmail.com'}, as: :json
      end

      it 'does not return a valid user token' do
        expect(json.keys).to_not include('token')
      end

      it "does not return the user's info" do
        expect(json.keys).to_not include('email')
        expect(json.keys).to_not include('name')
      end

      it 'returns an error message' do
        expect(json['errors']['attributes']).to eq({ "password" => ["does not match"] })
        expect(json['errors']['messages']).to eq ["Password does not match"]
      end

    end
  end
end
