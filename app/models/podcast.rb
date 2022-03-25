class Podcast < ApplicationRecord
  has_one_attached :recording
  # validates_uniqueness_of :number
end
