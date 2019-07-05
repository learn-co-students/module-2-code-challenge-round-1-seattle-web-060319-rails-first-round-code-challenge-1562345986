Rails.application.routes.draw do
  resources :powers
  resources :heroines 

  get '/search', to: 'heroines#index', as: 'search'
end
