class Rental < ApplicationRecord
  validates :name, :rent, :address, :building_age, presence: true
  validates :rent, :building_age, numericality: true

  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations
end
