require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

describe "Articles Controller" do
  describe "index" do
    it "returns correct number of articles saved" do
     get :index
    end
  end

  describe "show" do
    it "returns an article whose id is passed" do

      article_one = Article.new( {:title => "qqqqqq", :text => "asasas"} )
      article_one.save
      get :show , :id => article_one
      expect(article_one.title).to eq("qqqqqq")
    end
  end

  describe 'new' do
    it "" do

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
    it "upadtes an existing article" do

    end
  end

end
end
