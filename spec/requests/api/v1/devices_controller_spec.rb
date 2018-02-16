require 'rails_helper'

describe Api::V1::DevicesController, type: :request do
  describe '#create' do
    before do
      post api_v1_devices_path, as: :json
    end

    it 'creates a new device' do
      expect(Device.count).to eq 1
    end
    it 'returns a new device info' do
      expect(json.keys).to include('name', 'identification_string')
    end

    it 'returns a device auth token' do
      expect(json.keys).to include('token')
    end
  end
end
