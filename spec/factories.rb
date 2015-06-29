FactoryGirl.define do
  factory :article, aliases: [:comments] do
    title "My Blog"
    text  "My first blog"
  end


  factory :comment do
    comments
    commenter "Mr Gabhdi"
    body "Awesome blog"
  end
end
