Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  # REVIEW ROUTES
  # get '/reviews', to: 'reviews#index'
  # get '/reviews/new', to: 'reviews#new', as: 'new_review'
  # post '/reviews', to: 'reviews#create'
  # get '/reciews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  # patch '/reviews/:id', to: 'reviews#update'
  # get '/reviews/:id', to: 'reviews#show', as: 'review'
  # delete '/reviews/:id', to: 'reviews#destroy'
  
  resources :reviews 
end
