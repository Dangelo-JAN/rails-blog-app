require 'rails_helper'

RSpec.describe 'Post Show', type: :requests do
  it 'can see the post\'s title.' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('post1')
  end
  it 'can see who wrote the post' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('dangelo')
  end
  it 'can see how many comments it has' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Comment.create(text: 'comment1', author:, post:)
    Comment.create(text: 'comment2', author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end
  it 'can see how many likes it has' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Like.create(author:, post:)
    Like.create(author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end
  it 'can see the post body' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('text1')
  end
  it 'can see the username of each commentor' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Comment.create(text: 'comment1', author:, post:)
    Comment.create(text: 'comment2', author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('dangelo')
  end
  it 'can see the comment each commentor left' do
    author = User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Comment.create(text: 'comment1', author:, post:)
    Comment.create(text: 'comment2', author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('comment1')
    expect(page).to have_content('comment2')
  end
end