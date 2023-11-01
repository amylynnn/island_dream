class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island

  # validates :start_dates, presence: true
  # validates :end_dates, presence: true
  # validates :price, presence: true
  # validates :number_of_customers, presence: true
end
