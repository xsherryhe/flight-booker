class Passenger < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :date_of_birth, presence: true,
                            comparison: { less_than_or_equal_to: Date.today,
                                          message: 'cannot be later than today' }
  validates :email, presence: true, format: { with: /.+@.+\..+/ }
  belongs_to :booking
end
