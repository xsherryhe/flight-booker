class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  validates :passengers, presence: { message: 'Please fill out at least one passenger' }

  accepts_nested_attributes_for :passengers, reject_if: :all_blank
end
