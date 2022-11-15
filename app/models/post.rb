class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true

  belongs_to :user
  has_rich_text :content
end
