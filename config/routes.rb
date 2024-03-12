Rails.application.routes.draw do
  # Add routes for users, such as /users/sign_in, /users/sign_up, etc.
  # For all routes, run rake routes in Terminal
  devise_for :users
  
  # Set the root to the events index page
  # root 'controller#action'
  root 'events#index' # Should events be singular? 

  # Add routes for events, such as /events, /events/new, etc.
  resources :events #, only: [:index, :show, :new, :create]


end
