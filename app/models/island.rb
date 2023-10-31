class Island < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
