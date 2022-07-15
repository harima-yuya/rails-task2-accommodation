Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  
  resource :user,only: %i[show profile update]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new'
    get '/users/sign_out', to: 'users/sessions#destroy'
  end
  root "inns#index"
  
  get 'inns/index'
  get "inns", to:"inns#index"
  get 'inns/search'
  post "inns/search"
  get "inns/delete/:id", to: "inns#delete"
  get 'inns/add'
  post "inns/add", to: "inns#create"
  get 'inns/registreted'
  get 'inns/:id', to: "inns#show"
  
  get 'reserves/index'
  get 'reserves', to:"reserves#index"
  get 'reserves/add'
  get 'reserves/confrim'
  get 'reserves/complete'
  post 'reserves/confirm' 
  post 'reserves/back'
  post 'reserves/complete' 
  get 'reserves/:id', to: "reserves#show"

end
