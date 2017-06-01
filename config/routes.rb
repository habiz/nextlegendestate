Rails.application.routes.draw do
  get 'sessions/new'

  #get 'users/new'

  root 'static_pages#home'
  get '/home', to: 'static_pages#home'

  get '/services', to: 'static_pages#services'

  get '/gallery', to: 'static_pages#gallery'

  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

# add users model to the route
  resources :users
  resources :properties, only: [:create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
