Rails.application.routes.draw do
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :posts do
    resources :comments
  end
  root 'posts#index'

  get '/about', to: 'pages#about'
end
