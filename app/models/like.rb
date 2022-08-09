class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :like_count

  def like_count
    post.update(likes_counter: post.likes.count)
  end
end
