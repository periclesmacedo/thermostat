require 'rails_helper'

describe Api::V1::SessionsController, type: :request do
  describe '#signup' do
    context 'when the user is valid' do
      before do
        post api_v1_signup_path, params: {name: 'user', email: 'user@gmail.com', password: 'defaultPass',
                        password_confirmation: 'defaultPass'}, as: :json
      end
      it 'creates a new user' do
        expect(User.count).to eq 1
        expect(User.first.email).to eq 'user@gmail.com'
      end
      it "returns the user's info" do
        json = JSON.parse response.body
        expect(json.keys).to include('name', 'email')
      end
      it "returns the user's token" do
        json = JSON.parse response.body
        expect(json.keys).to include('token')
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
        json = JSON.parse response.body
        expect(json.keys).to_not include('name', 'email')
        expect(json['errors']['messages']).to eq ["Email can't be blank"]
        expect(json['errors']['attributes']).to eq({ "email" => ["can't be blank"] })
      end

    end
  end
end
