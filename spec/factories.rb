FactoryGirl.define do
  factory :author do
    name     "Hartl"
    firstname     "Michael"
    email    "michael@example.com"
    lab      "1"
    password "foobar"
    password_confirmation "foobar"
  end
end
