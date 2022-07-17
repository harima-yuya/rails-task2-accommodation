Rails.application.routes.draw do
  root "inns#index"
  get 'inns/registreted'
  get 'inns/search'
  resources :inns

  get 'reserves/confrim'
  post 'reserves/confirm' 
  get 'reserves/complete'
  post 'reserves/back'
  post 'reserves/complete' 
  resources :reserves

  get 'users/account'
  get 'users/profile'
  
  resource :user,only: %i[show update]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new'
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

end
