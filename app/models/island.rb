class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :location, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
