CourseProject::Application.routes.draw do
  resources :posts

  root to: "main#index"

end
