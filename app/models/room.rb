class Room < ApplicationRecord
  has_many :messages

  validates :name, :description, :image_url, presence: true
  validates :name, uniqueness: true

end
