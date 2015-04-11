require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :article do
    sequence(:title) { |n| "Article #{n}" }
    author "Gen"
    url "http://genohta.com/blog/1"
    summary "This is a generic summary about the stuff"
  end

  factory :article_tag do
    article
    tag
  end

  factory :tag do
    sequence(:word) { |n| "Tag #{n}" }
  end

end
