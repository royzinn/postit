Postit::Application.routes.draw do
  root to: 'posts#index'

  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  get "/logout", to: 'sessions#destroy'
  get "/signup", to: 'users#new'

  resources :posts, except: [:destroy] do
  	resources :comments
  end

  resources :users, only: [:new, :create] do
  	resources :comments
  end
end
