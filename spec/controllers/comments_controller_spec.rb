require 'spec_helper'

describe CommentsController do

  render_views
  login_user

  before(:each) do
    @photo = FactoryGirl.create(:photo)
  end

  describe "GET index" do
    it "assigns all comments as @comments" do
      comment = FactoryGirl.create(:comment, :photo_id => @photo.id)
      get :index, :photo_id => @photo.id
      assigns(:comments).should eq([comment])
    end
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      comment = FactoryGirl.create(:comment, :photo_id => @photo.id)
      get :show, {:photo_id => @photo.id, :id => comment.id}
      assigns(:comment).should eq(comment)
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new, { :photo_id => @photo.id }
      assigns(:comment).should be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = FactoryGirl.create(:comment, :photo_id => @photo.id)
      get :edit, {:photo_id => @photo.id, :id => comment.id}
      assigns(:comment).should eq(comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, photo_id: @photo.id, comment: { comment: "new comment" }
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, photo_id: @photo.id, comment: FactoryGirl.attributes_for(:comment, photo: @photo)
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, photo_id: @photo.id, comment: FactoryGirl.attributes_for(:comment, photo: @photo)
        response.should redirect_to(@photo)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:photo_id => @photo.id, :comment => {}}
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:photo_id => @photo.id, :comment => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = FactoryGirl.create(:comment)
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update_attributes).with({'name' => 'changed'})
        put :update, {:photo_id => comment.photo_id, 
          :id => comment.to_param, 
          :comment => {'name' => 'changed'}}
      end

      it "assigns the requested comment as @comment" do
        comment = @photo.comments.create
        put :update, photo_id: comment.photo_id, id: comment.id, comment: { :comment => "updated"}
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        comment = FactoryGirl.create(:comment)
        put :update, photo_id: comment.photo_id, id: comment.id, 
          comment: FactoryGirl.attributes_for(:comment, photo: nil)
        response.should redirect_to(comment.photo)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = FactoryGirl.create(:comment)
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:photo_id => comment.photo_id, :id => comment.to_param, :comment => {}}
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = FactoryGirl.create(:comment)
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:photo_id => comment.photo_id, :id => comment.to_param, :comment => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = FactoryGirl.create(:comment)
      expect {
        delete :destroy, {:photo_id => comment.photo_id, :id => comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = FactoryGirl.create(:comment)
      delete :destroy, { :photo_id => comment.photo_id, :id => comment.to_param}
      response.should redirect_to(comment.photo)
    end
  end

end
