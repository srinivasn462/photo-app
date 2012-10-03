require 'spec_helper'

describe PhotosController do

  render_views
  login_user

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe "GET index" do
    it "assigns all photos as @photos" do
      photo = FactoryGirl.create(:photo)
      get :index
      assigns(:photos).should eq([photo])
    end
  end

  describe "GET show" do
    it "assigns the requested photo as @photo" do
      photo = FactoryGirl.create(:photo)
      get :show, {:id => photo.to_param}
      assigns(:photo).should eq(photo)
    end
  end

  describe "GET new" do
    it "assigns a new photo as @photo" do
      get :new
      assigns(:photo).should be_a_new(Photo)
    end
  end

  describe "GET edit" do
    it "assigns the requested photo as @photo" do
      photo = FactoryGirl.create(:photo)
      get :edit, {:id => photo.to_param}
      assigns(:photo).should eq(photo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Photo" do
        expect {
          post :create, {:photo => FactoryGirl.attributes_for(:photo)}
        }.to change(Photo, :count).by(1)
      end

      it "assigns a newly created photo as @photo" do
        post :create, {:photo => FactoryGirl.attributes_for(:photo)}
        assigns(:photo).should be_a(Photo)
        assigns(:photo).should be_persisted
      end

      it "redirects to the created photo" do
        post :create, {:photo => FactoryGirl.attributes_for(:photo)}
        response.should redirect_to(Photo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved photo as @photo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        post :create, {:photo => {}}
        assigns(:photo).should be_a_new(Photo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        post :create, {:photo => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested photo" do
        photo = FactoryGirl.create(:photo)
        # Assuming there are no other photos in the database, this
        # specifies that the Photo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Photo.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => photo.to_param, :photo => {'these' => 'params'}}
      end

      it "assigns the requested photo as @photo" do
        photo = FactoryGirl.create(:photo)
        put :update, {:id => photo.to_param, :photo => FactoryGirl.attributes_for(:photo)}
        assigns(:photo).should eq(photo)
      end

      it "redirects to the photo" do
        photo = FactoryGirl.create(:photo)
        put :update, {:id => photo.to_param, :photo => FactoryGirl.attributes_for(:photo)}
        response.should redirect_to(photo)
      end
    end

    describe "with invalid params" do
      it "assigns the photo as @photo" do
        photo = FactoryGirl.create(:photo)
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        put :update, {:id => photo.to_param, :photo => {}}
        assigns(:photo).should eq(photo)
      end

      it "re-renders the 'edit' template" do
        photo = FactoryGirl.create(:photo)
        # Trigger the behavior that occurs when invalid params are submitted
        Photo.any_instance.stub(:save).and_return(false)
        put :update, {:id => photo.to_param, :photo => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested photo" do
      photo = FactoryGirl.create(:photo)
      expect {
        delete :destroy, {:id => photo.to_param}
      }.to change(Photo, :count).by(-1)
    end

    it "redirects to the photos list" do
      photo = FactoryGirl.create(:photo)
      delete :destroy, {:id => photo.to_param}
      response.should redirect_to(photos_url)
    end
  end

end
