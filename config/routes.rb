CourseProject::Application.routes.draw do
  resources :posts do
  	resources :comments
  	resources :votes
  end

  resources :users

  root to: "posts#index"

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'



end
