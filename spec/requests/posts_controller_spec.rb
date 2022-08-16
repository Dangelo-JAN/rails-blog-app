require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) { get user_posts_path(2) }
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
    before(:each) { get user_post_path(2, 1) }

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
