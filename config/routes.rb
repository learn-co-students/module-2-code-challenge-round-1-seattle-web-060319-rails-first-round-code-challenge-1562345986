Rails.application.routes.draw do
  get '/heroines/search', to: 'heroines#search', as: '/search'
  resources :powers
  resources :heroines
end
