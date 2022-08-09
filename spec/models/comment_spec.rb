require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 1)
    @post = Post.new(author: @user, title: 'title', text: 'text', comments_counter: 1, likes_counter: 1)
    @user.save
    @post.save
  end

  subject { Comment.new(author: @user, text: 'comment', post: @post) }

  before { subject.save }

  it 'Text is not require.1' do
    subject.text = 'comment'
    expect(subject).to be_valid
  end

  it 'Text is not require.2' do
    subject.text = nil
    expect(subject).to be_valid
  end

  it 'Has author' do
    expect(subject.author).to eq(@user)
  end

  it 'Has post' do
    expect(subject.post).to eq(@post)
  end
end
