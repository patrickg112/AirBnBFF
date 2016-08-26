Rails.application.routes.draw do
  root 'welcome#index'

  resources :hosts, only: [:index, :show]
  resources :travelers, only: [:index, :show]
  get '/users/:id/recommendations' => 'users#recommendations'

  get '/hosts/:id/requests' => 'users#requests'
  
end
