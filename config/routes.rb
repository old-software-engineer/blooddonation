Rails.application.routes.draw do
  

  root to: "home#index"
  resources :home
  resources :donors
  
  #devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts do 
  	collection do 
  		get '/all_lat_longitude', to: 'contacts#all_lat_longitude'
  		post '/all_lat_longitude', to: 'contacts#all_lat_longitude'
  	end
  end
end
