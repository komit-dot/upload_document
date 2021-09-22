class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  def self.counts
  # self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")

  self.select("tags.id, tags.name,count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
end
end
