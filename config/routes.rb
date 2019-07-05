Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]  

  post '/heroines/search', to: 'heroines#search'
  
end
