Rails.application.routes.draw do
  resources :people, only: ['create', 'show']

  get '/export' => 'utils#export'
  get '/import' => 'utils#import'
  root 'events#index'
end
