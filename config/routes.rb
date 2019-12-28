Rails.application.routes.draw do
  resources :people, only: ['create', 'show']
  resources :users, only: ['show']

  get '/export' => 'utils#export'
  get '/import' => 'utils#import'
  root 'events#index'
end
