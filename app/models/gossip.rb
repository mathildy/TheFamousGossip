class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_gossip_links
  has_many :tags, through: :tag_gossip_links
  has_many :comments
  has_many :sub_comments, through: :comment
  has_many :likes

  validates :title, presence: true
  validates :content, presence: true

end
