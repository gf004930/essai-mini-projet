FactoryGirl.define do
  factory :author do
    name     "Hartl"
    firstname     "Michael"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
