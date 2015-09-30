FactoryGirl.define do
  factory :client do
    name "La Web Shop"
    sequence(:email) { |n| "johndoe#{n}@lawebshop.com"}
  end

end
