require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe "index" do
    it "returns correct number of articles saved" do
      Article.create( {:title => "onetwo", :text => "asasas"} )
      Article.create( title: "onwtwo", text: "asasas" )
      get :index
      expect(assigns(:articles).count).to eq 2
    end

  end


  describe "show" do
    it "returns an article whose id is passed" do

      article_one = Article.create( {:title => "qqqqqq", :text => "asasas"} )
      get :show , :id => article_one
      expect(article_one.title).to eq("qqqqqq")
    end
  end

  describe 'new' do
    it "should initialize a new article object" do
      get :new

    end
  end

  describe 'edit' do
    it 'finds and edits the article' do


    end
  end

  describe 'create' do
    it 'it creates and saves a new article' do
      counts = Article.all.count
      post :create , :article => { :title => "heyyaaa" , :text => "yesss"}
      expect(Article.all.count).to eq(counts+1)
    end
  end

  describe "update" do
    it "updates an existing article" do
    end
    it "renders the edit template" do
      article_one = Article.create( {:title => "qqqqqq", :text => "asasas"} )
      attr = {:title => "new title", :text => "new content" }
      put :update, :id => article_one.id, :article => attr
      article_one.reload
      expect(article_one.title).to eq attr[:title] 
      expect(article_one.text).to eq attr[:text] 
    end


  end

end
