Rails.application.routes.draw do
  

  root to: "home#index"
  resources :home
  resources :contacts
  resources :donors
  
  #devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
