Rails.application.routes.draw do
  devise_for :users
  root 'home#index' # likely want to change this to something else

end
