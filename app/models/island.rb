class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :location, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :photos, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_location_and_name,
  against: [ :location, :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
