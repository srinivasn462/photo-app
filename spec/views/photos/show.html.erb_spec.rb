require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :description => "Description",
      :content_type => "Content Type",
      :file_name => "File Name",
      :binary_data => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Content Type/)
    rendered.should match(/File Name/)
    rendered.should match(//)
  end
end
