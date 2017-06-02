class Photo < ApplicationRecord
  
  belongs_to :listing

  mount_uploader :image, PhotoUploader
  # serialize :photos, JSON
end