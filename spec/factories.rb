include ActionDispatch::TestProcess
FactoryGirl.define do
    
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    description "Texto de los diseadores"
    picture { fixture_file_upload(Rails.root.join(*%w[spec fixtures files example.jpg]), 'image/jpg') }
  
  end
end