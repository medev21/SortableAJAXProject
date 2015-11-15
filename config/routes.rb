Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks do
    collection { post :sort }
  end
end
