require  'web_token'
require 'securerandom'

class Api::V1::DevicesController < ApplicationController
  def create
    @device = Device.create(identification_string: SecureRandom.urlsafe_base64(8))
    @token = WebToken.encode({id: @device.id, id_string: @device.identification_string})
  end
end
