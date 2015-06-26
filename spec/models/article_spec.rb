require "rails_helper"

RSpec.describe Article, :type => :model do
  it "should return correct text and title" do
    sartaj = Article.create!(title: "sartaj", text: "singh")
    expect(sartaj.text).to eq("singh")
    expect(sartaj.title).to eq("sartaj")
  end

  it { should have_many(:comments) }
end
