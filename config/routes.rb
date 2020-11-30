Rails.application.routes.draw do
  root 'tasks#index'
  get 'index' => 'tasks#index'
  resources :tasks

end
