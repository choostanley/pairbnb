class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos

  paginates_per 10

  enum verified: [:unverified, :verified]
  # mount_uploaders :photos, PhotoUploader
  # serialize :photos, JSON
end
