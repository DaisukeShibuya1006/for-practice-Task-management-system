Rails.application.routes.draw do
  resources :tasks
  # get 'tasks' => 'tasks#index'
  # post "/tasks" =>'tasks#create'
  # get "tasks/new" => "tasks#new"
  # get "tasks/:id/edit" => "tasks#edit"
  # get "tasks/:id" => 'tasks#show'
  # patch "tasks/:id" => "tasks#update"
end
