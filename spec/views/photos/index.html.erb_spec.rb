require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :description => "Description",
        :content_type => "Content Type",
        :file_name => "File Name",
        :binary_data => ""
      ),
      stub_model(Photo,
        :description => "Description",
        :content_type => "Content Type",
        :file_name => "File Name",
        :binary_data => ""
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
