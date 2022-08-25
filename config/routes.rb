Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    root 'devise/sessions#new'
    get '/login', to: 'devise/sessions#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end

  # redirect to users_index_path toguether with Application_controller's method: after_sign_in_path_for
  get '/users' => "users#index", :as => :users_root

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
