class Comment < ActiveRecord::Base
  belongs_to :photo
  attr_accessible :comment, :name
end
