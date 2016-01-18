class Pet < ActiveRecord::Base
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  mount_uploader :image, PetPhotoUploader
  belongs_to :user

end
