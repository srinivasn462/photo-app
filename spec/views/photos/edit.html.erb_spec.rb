require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :description => "MyString",
      :content_type => "MyString",
      :file_name => "MyString",
      :binary_data => ""
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path(@photo), :method => "post" do
      assert_select "input#photo_description", :name => "photo[description]"
      assert_select "input#photo_content_type", :name => "photo[content_type]"
      assert_select "input#photo_file_name", :name => "photo[file_name]"
      assert_select "input#photo_binary_data", :name => "photo[binary_data]"
    end
  end
end
