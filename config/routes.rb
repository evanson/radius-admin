Rails.application.routes.draw do
  get 'users/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy ]
  resources :users, :controller => "users"
  resources :radiuslogins, :controller => "radpostauth", only: [:show,:index]

  match '/signin', to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: [:delete, :get]

end
