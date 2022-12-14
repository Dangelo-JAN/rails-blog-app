require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'John', photo: '', bio: '')
    @post = Post.create(title: 'Post Title', text: 'Post Content', author: @user)
  end

  describe 'GET #index' do
    before(:each) { get user_posts_path(@user) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the show template' do
      expect(response.body).to include('This is the posts/index view')
    end
  end

  describe 'GET #show' do
    before(:each) { get user_post_path(@user, @post) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the show template' do
      expect(response.body).to include('This is the posts/show view')
    end
  end
end
