class WebToken
  class << self
    def encode(payload, expire = 1.month.from_now)
      payload[:expiration] = expire.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    rescue
      nil
    end
  end
end
