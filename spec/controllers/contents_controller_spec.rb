require 'spec_helper'

describe ContentsController do
  context "Index" do
    it "lists all the bookmarks" do
      get :index
      expect(response).to render_template("index")
    end
  end

	context "Create" do

    it "creates a bookmark successfully" do      
      post :create , {:content=>{"url"=>"http://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html", "title"=>"testing", "rates"=>"0", "user_id"=>"v", "tags"=>""}}
      ImageWorker.drain
      assert_equal 0, ImageWorker.jobs.size
      File.exist?("#{Rails.root}/public/snapshot#{Content.last.image_file_name}.jpg")
  	end

    let(:content){FactoryGirl.attributes_for(:content, url:"")}
    it "does not create bookmark if url is missing" do
      post :create, {content: content}
      expect(response).to render_template("new")
    end

  end

  context "Delete" do

    let(:content1){FactoryGirl.create(:content)}
    it"destroys a Bookmark successfully" do
      delete :destroy, {id: content1 }
      expect(response).to redirect_to(contents_path)
    end   
  end
end