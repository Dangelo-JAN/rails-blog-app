require 'rails_helper'

RSpec.describe 'Post index', type: :requests do
  it 'can see the users profile picture' do
    User.create(name: 'dangelo', photo: 'https://robohash.org/hshshs/', bio: 'teacher from Poland')
    visit '/users'
    expect(page).to have_css('img')
  end

  it 'can see the users name' do
    User.create(name: 'dangelo', photo: '', bio: 'teacher from Poland')
    visit '/users'
    expect(page).to have_content('dangelo')
  end

  it 'can see the number of posts' do
    author = User.create(name: 'dangelo', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    visit '/users'
    expect(page).to_not have_content('1')
    expect(page).to have_content('2')
  end

  it 'can see the posts title' do
    author = User.create(name: 'dangelo', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    visit "/users/#{author.id}/posts"
    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
  end

  it 'can see the first comments on a posts' do
    author = User.create(name: 'dangelo', photo: '', bio: 'teacher from Poland')
    post1 = Post.create(title: 'post1', text: 'text1', author:)
    post2 = Post.create(title: 'post2', text: 'text2', author:)
    Comment.create(text: 'comment1', author:, post: post1)
    Comment.create(text: 'comment2', author:, post: post2)
    visit "/users/#{author.id}/posts"
    expect(page).to have_content(post1.comments_counter)
    expect(page).to have_content(post2.comments_counter)
  end

  it 'can see the number of comments on a post' do
    author = User.create(name: 'dangelo', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Comment.create(text: 'comment1', author:, post: Post.first)
    Comment.create(text: 'comment2', author:, post: Post.last)
    visit '/users'
    expect(page).to_not have_content('1')
    expect(page).to have_content('2')
  end

  it 'can see the how many likes a post has' do
    author = User.create(name: 'dangelo', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Like.create(author:, post: Post.first)
    Like.create(author:, post: Post.last)
    visit "/users/#{author.id}/posts"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end

  it 'Asserts I can see some of the posts body' do
    author = User.create(name: 'Dangelo', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'post1', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    Post.create(title: 'post3', text: 'text3', author:)
    Post.create(title: 'post4', text: 'text4', author:)
    Post.create(title: 'post5', text: 'text5', author:)
    Post.create(title: 'post6', text: 'text6', author:)
    Post.create(title: 'post7', text: 'text7', author:)
    Post.create(title: 'post8', text: 'text8', author:)
    Post.create(title: 'post9', text: 'text9', author:)
    Post.create(title: 'post10', text: 'text10', author:)

    visit "/users/#{author.id}/posts"
    expect(page).to_not have_content('Like Post')
  end

  it 'redirects to Post show page when clicking on a post' do
    author = User.create(name: 'henry', photo: '', bio: 'teacher from Poland')
    Post.create(title: 'SpecialPost', text: 'text1', author:)
    Post.create(title: 'post2', text: 'text2', author:)
    visit "/users/#{author.id}/posts"
    click_on 'SpecialPost'
    expect(page).to_not have_content('Post show page')
  end
end
