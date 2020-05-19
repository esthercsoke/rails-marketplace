Rails.application.routes.draw do
  get 'payments/index'
  get 'payments/pay'
  get 'messages/index'
  get 'conversations/index'
  devise_for :users
  get '/', to: 'listings#home', as: 'root'
  get '/listings', to: 'listings#index', as: 'listings'
  get '/listings/new', to: 'listings#new', as: 'new_listing'
  post '/listings', to: 'listings#create'
  get '/listings/:id', to: 'listings#show', as: 'listing'
  get '/pages/profile', to: 'users#profile', as: 'profile'

  resources :charges, only: [:new, :create]
# the edit routes 
# the get edit_listing is rendering out the html thats required to update the listing and will give back form
# wont physically update the form
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  # any put or path requests that get made there will get handled by this controller actions
  put '/listings/:id', to: 'listings#update'
  patch '/listings/:id', to: 'listings#update'
  delete '/listings/:id', to: 'listings#destroy'
  resources :listings
  resources :categories
  resources :users

  resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :create]
  end
end
