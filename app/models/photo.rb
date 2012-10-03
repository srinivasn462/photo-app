class Photo < ActiveRecord::Base
  has_many :comments
  attr_accessible :description, :photo
  mount_uploader :photo, PhotoUploader
end
