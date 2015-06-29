require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe "index" do
    it "returns correct number of articles saved" do
      create(:article)
      create(:article, title: "newname")
     
      get :index
      expect(assigns(:articles).count).to eq 2
    end

    it "returns ok response " do
      expect(response.status).to eq 200
    end

  end


  describe "show" do
    it "returns an article whose id is passed" do
      article_one = Article.create( {:title => "qqqqqq", :text => "asasas"} )
      get :show , :id => article_one.id
      expect(assigns(:article)).to eq article_one
    end

    it "returns ok response " do
      expect(response.status).to eq 200
    end

  end

  describe 'new' do
    it "should initialize a new article object" do
      Article.create( {:title => "qqqqqq", :text => "asasas"} )
      get :new
      expect(assigns(:article).id).to eq nil
    end

    it "returns ok response " do
      expect(response.status).to eq 200
    end
  end

  describe 'edit' do
    it 'finds and edits the article' do
      article_one = Article.create( {:title => "qqqqqq", :text => "asasas"} )
      get :edit , :id => article_one.id
      expect(assigns(:article)).to eq article_one

    end

    it "returns ok response " do
      expect(response.status).to eq 200
    end
  end

  describe 'create' do
    it 'it creates and saves a new article' do
      counts = Article.all.count
      post :create , :article => { :title => "heyyaaa" , :text => "yesss"}
      expect(Article.all.count).to eq(counts+1)
    end
    it "returns ok response " do
      expect(response.status).to eq 200
    end
  end

  describe "update" do
    it "returns new updated values for an existing article" do
      article_one = Article.create( {:title => "qqqqqq", :text => "asasas"} )
      attr = {:title => "new title", :text => "new content" }
      put :update, :id => article_one.id, :article => attr
      article_one.reload
      expect(article_one.title).to eq attr[:title] 
      expect(article_one.text).to eq attr[:text] 
    end
    it "returns ok response " do
      expect(response.status).to eq 200
    end
  end

  describe "delete" do
    it "deletes an article" do
      article_one = Article.create( {:title => "oneone", :text => "asasas"} )
      article_two = Article.create( title: "onwtwo", text: "asasas" )
      total_count = Article.all.count
      delete :destroy , :id => article_one
      expect(Article.all.count).to eq(total_count - 1)
    end
    it "returns ok response " do
      expect(response.status).to eq 200
    end
  end
end

