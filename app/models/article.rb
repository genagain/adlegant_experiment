class Article < ActiveRecord::Base
  has_many :articletags
  has_many :tags, through: :articletags

  def get_tags
    articletags = ArticleTag.where(article: self)
    tags = []
    articletags.each do |articletag|
      tags << Tag.find(articletag.tag_id).word
    end
    tags
  end
end
