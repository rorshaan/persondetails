require 'rails_helper'

RSpec.describe Detail, type: :model do
  describe "validations" do
    it "is valid with a valid email" do
      detail = FactoryBot.build(:detail, email: "test@example.com")
      expect(detail).to be_valid
    end

    it "is invalid without an email" do
      detail = FactoryBot.build(:detail, email: nil)
      expect(detail).to_not be_valid
      expect(detail.errors[:email]).to include("can't be blank")
    end
  end
end
