class Pet < ActiveRecord::Base
  mount_uploader :image, PetPhotoUploader
  belongs_to :user
end
