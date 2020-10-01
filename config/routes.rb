Rails.application.routes.draw do
  get 'tasks/index'
  get "tasks/:id" => 'tasks#show'
  get 'tasks/create'
  get 'tasks/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
