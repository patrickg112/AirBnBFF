Rails.application.routes.draw do
  root 'welcome#index'

  resources :hosts, only: [:index, :show]
  resources :travelers, only: [:index, :show]

  get '/travelers/:id/recommendations' => 'travelers#recommendations'
  get '/travelers/:id/compatible' => 'travelers#requests'
  
  get '/hosts/:id/requests' => 'hosts#requests'

end
