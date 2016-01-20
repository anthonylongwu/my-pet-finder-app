class PetImage < ActiveRecord::Base
  belongs_to :pet

  mount_uploader :name, PetPhotoUploader
end
