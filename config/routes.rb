Rails.application.routes.draw do
 
  root 'access#index'

  resources :users

  match ':controller(/:action(/:id))', :via => [:get, :post]
  
end
