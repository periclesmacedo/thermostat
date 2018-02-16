class User < ApplicationRecord
  has_many :devices

  has_secure_password

  validates :name, :email, presence: true
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 8, on: :create

  def authenticate(password)
    is_auth = super
    unless is_auth
      errors.add(:password, "does not match")
    end
    is_auth
  end
end
