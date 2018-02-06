require 'faker'

FactoryBot.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password 'testPassword'
    password_confirmation 'testPassword'
  end
end
