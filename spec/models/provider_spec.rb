require 'rails_helper'

RSpec.describe Provider, type: :model do

  it "is valid with a name, email" do
    provider = Provider.new(
     name: "La Web Shop",
     email: "info@lawebshop.ca"
    )
    expect(provider).to be_valid
  end

  it "is invalid without a name" do
    provider = Provider.new(
      name: nil
    )

    provider.valid?
    expect(provider.errors[:name]).to include("can't be blank")
  end
  it "is invalid without an email address" do
    provider = Provider.new(
        email: nil
    )

    provider.valid?
    expect(provider.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate emnail address" do
    Provider.create(
      name: "La Web Shop",
      email: "info@lawebshop.ca"
    )
    provider = Provider.new(
      name: "Eckinox",
      email: "info@lawebshop.ca"
    )
    provider.valid?
    expect(provider.errors[:email]).to include("has already been taken")
  end
end
