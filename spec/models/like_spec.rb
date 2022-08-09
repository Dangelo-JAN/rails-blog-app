require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 1)
    @post = Post.new(author: @user, title: 'title', text: 'text', comments_counter: 1, likes_counter: 1)
    @user.save
    @post.save
  end

  subject { Like.new(author: @user, post: @post) }

  before { subject.save }

  it 'has author' do
    expect(@post.author).to eq(@user)
  end

  it 'has post' do
    expect(subject.post).to eq(@post)
  end
end
