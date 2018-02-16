FactoryBot.define do
  factory :device do
    name Faker::Lorem.word
    identification_string Faker::Lorem.characters

    trait :with_user do
      after(:create) do |device|
        create :user, devices: [device]
      end
    end
  end
end
