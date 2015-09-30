require 'rails_helper'

RSpec.describe Provider, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:provider)).to be_valid
  end

  it "is valid with a name, email" do
    provider = FactoryGirl.build(:provider, name: nil)
    expect(provider).to be_valid
  end

  it "is invalid without a name" do
    provider = FactoryGirl.build(:provider, name: nil)

    provider.valid?
    expect(provider.errors[:name]).to include("can't be blank")
  end
  it "is invalid without an email address" do
    provider = FactoryGirl.build(:provider, email: nil)
    provider.valid?
    expect(provider.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:provider, email: 'info@lawebshop.ca')
    provider = FactoryGirl.build(:provider, email: 'info@lawebshop.ca')
    provider.valid?
    expect(provider.errors[:email]).to include("has already been taken")
  end
end
