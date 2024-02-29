require 'rails_helper'

RSpec.describe Person, type: :model do

  describe "validations" do
    it "is valid with a valid name" do
      person = FactoryBot.build(:person, name: "John Doe")
      expect(person).to be_valid
    end

    it "is invalid without a name" do
      person = FactoryBot.build(:person, name: nil)
      expect(person).to_not be_valid
      expect(person.errors[:name]).to include("can't be blank")
    end
  end
end
