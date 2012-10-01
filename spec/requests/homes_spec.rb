require 'spec_helper'

describe "Home controller" do
  describe "GET /home" do
    it "should have the content 'Login'" do
      visit '/home/index'
      page.should have_content('Login')
    end
  end
end
