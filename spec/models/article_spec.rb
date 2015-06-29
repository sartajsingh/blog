require "rails_helper"

RSpec.describe Article, :type => :model do
  it "should return correct text and title" do
    sartaj = Article.create(title: "sartaj", text: "singh")
    expect(sartaj.text).to eq("singh")
    expect(sartaj.title).to eq("sartaj")
  end

  it { should have_many(:comments) }

  it "should accept a title with 5 characters or more " do
    article_one = Article.new(title: "qbfadjklsb", text: "kgks")
    expect(article_one.valid?).to eq true
  end

  it "shouldnt accept a title with characters lesser than 5 " do
    article_one = Article.new(title: "q", text: "kgks")
    expect(article_one.valid?).to eq false
  end
end
