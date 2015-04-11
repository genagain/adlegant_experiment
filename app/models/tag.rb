class Tag < ActiveRecord::Base
  has_many :articletags
  has_many :articles, through: :articletags
end
