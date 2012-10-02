class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_protected :file_name, :content_type, :binary_data
  def image_file=(input_data)
    self.file_name input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
end
