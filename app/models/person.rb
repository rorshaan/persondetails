class Person < ApplicationRecord
  has_many :details, dependent: :destroy
  validates :name, presence: true

  accepts_nested_attributes_for :details
end
