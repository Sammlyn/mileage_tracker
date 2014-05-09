MileageTracker::Application.routes.draw do
  get "models/index"
  get "models/show"
  get "models/new"
  get "models/create"
  get "models/edit"
  get "models/update"
  get "makes/index"
  get "makes/show"
  get "makes/new"
  get "makes/create"
  get "makes/edit"
  get "makes/update"
  resources :vehicles
  resources :mileages, only: [:index, :new, :create]

  root to: 'vehicles#index'
end

