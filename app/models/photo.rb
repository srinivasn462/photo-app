class Photo < ActiveRecord::Base
  attr_accessible :description, :photo
  mount_uploader :photo, PhotoUploader
end
