require 'rails_helper'

RSpec.describe Client, type: :model do

  it "is valid with a name, email" do
    client = Client.new(
        name: "La Web Shop",
        email: "info@lawebshop.ca"
    )
    expect(client).to be_valid
  end

  it "is invalid without a name" do
    client = Client.new(
        name: nil
    )

    client.valid?
    expect(client.errors[:name]).to include("can't be blank")
  end
  it "is invalid without an email address" do
    client = Client.new(
        email: nil
    )

    client.valid?
    expect(client.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
    Client.create(
        name: "La Web Shop",
        email: "info@lawebshop.ca"
    )
    client = Client.new(
        name: "Eckinox",
        email: "info@lawebshop.ca"
    )
    client.valid?
    expect(client.errors[:email]).to include("has already been taken")
  end
end
