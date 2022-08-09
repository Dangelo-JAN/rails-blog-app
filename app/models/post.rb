class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :post_count

  def post_count
    author.update(posts_counter: author.posts.count)
  end

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
