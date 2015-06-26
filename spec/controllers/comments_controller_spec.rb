require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe 'create' do
    it 'it increases the count of comments by one' do
      article_one = Article.create( {:title => "oneone", :text => "asasas"} )
      counts = Comment.all.count
      post :create , :article_id => article_one.id, :comment => { :commenter => "gabhdia" , :body => "yesss-huhuha"}
      expect(Comment.all.count).to eq(counts+1)
    end
  end
  describe "delete" do
    it "deletes an article" do
      article_one = Article.create( {:title => "oneone", :text => "asasas"} )
      comment_one = article_one.comments.create( commenter: "onwtwo", body: "asasas" )
      total_count = Comment.all.count
      delete :destroy , :article_id => article_one.id, :id => comment_one.id
      expect(Comment.all.count).to eq(total_count - 1)
    end
  end
end
