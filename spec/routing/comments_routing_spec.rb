require 'rails_helper'
RSpec.describe "CommentsControllerRoutes", :type => :routing do
  it 'routes to comments#create' do
    expect(:post => '/articles/a/comments').to route_to('comments#create', {'article_id' => 'a'})
  end

  it 'routes to comments#destroy' do
    expect(:delete => '/articles/a/comments/b').to route_to('comments#destroy', {'article_id'=>'a', 'id' => 'b'})
  end
end
