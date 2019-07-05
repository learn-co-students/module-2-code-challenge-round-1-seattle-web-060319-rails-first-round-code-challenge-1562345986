Rails.application.routes.draw do
  resources :powers, only: [:index, :show] do
    get 'search', on: :collection
  end
  resources :heroines, only: [:index, :show, :new, :create]
end
