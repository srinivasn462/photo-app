class HomeController < ApplicationController
  def index
    @photos = Photo.find(:all, :order => "id desc", :limit => 3)
  end
end
