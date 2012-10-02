require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :description => "MyString",
      :content_type => "MyString",
      :file_name => "MyString",
      :binary_data => ""
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path, :method => "post" do
      assert_select "input#photo_description", :name => "photo[description]"
      assert_select "input#photo_content_type", :name => "photo[content_type]"
      assert_select "input#photo_file_name", :name => "photo[file_name]"
      assert_select "input#photo_binary_data", :name => "photo[binary_data]"
    end
  end
end
