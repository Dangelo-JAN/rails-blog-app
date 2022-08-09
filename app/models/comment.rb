class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :comment_count

  def comment_count
    post.update(comments_counter: post.comments.count)
  end
end
