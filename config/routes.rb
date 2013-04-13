Postit::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
  	resources :comments
  end

  resources :users do
  	resources :comments
  end
end
