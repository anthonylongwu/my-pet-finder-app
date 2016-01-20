class Pet < ActiveRecord::Base
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  belongs_to :user
  has_many :pet_images

end
