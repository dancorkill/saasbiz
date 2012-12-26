CourseProject::Application.routes.draw do
  resources :posts do
  	resources :comments
  	resources :votes
  end

  root to: "posts#index"



end
