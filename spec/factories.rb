require 'factory_girl'
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "secret"
    password_confirmation "secret"
  end

  factory :photo do
    description "test photo"
    photo { fixture_file_upload(Rails.root.join('spec', 'photos', 'LeadvilleHike.jpg'), 'image/jpg') }
  end
end
