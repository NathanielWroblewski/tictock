Clock::Application.routes.draw do

  root to: 'places#index'

  resources :places, only: :index

  get '/places/:place', to: 'places#show'
end
