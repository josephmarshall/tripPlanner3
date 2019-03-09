Rails.application.routes.draw do
  root 'trips#index'
  

  devise_for :users

  resources :trips do
    resources :locations
    get 'random_trips', on: :collection
  end

  resources :locations do
    resources :addresses
  end
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
