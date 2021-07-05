Rails.application.routes.draw do
  devise_for :users, :controllers =>{:registrations => "registrations"}
    #change the route from /user/login to /login route
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to:'devise/registrations#new'
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :lists, only: [ :index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
