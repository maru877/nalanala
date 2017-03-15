class Station < ApplicationRecord
  validates :line_name, :station_name, :time, presence: true
  validates :time, numericality: true

  belongs_to :rental, optional: true
end
