Rails.application.routes.draw do
  
  get 'posts/index'
  get "posts", to: "posts#index"
  
  

  root 'posts#home'
  get "posts/home"

  get "posts/search"
  post "posts/search"
  
  
  get 'posts/add'
  post "posts/add", to: "posts#create"

  get 'posts/:id', to: "posts#show"
 
  get 'posts/edit/:id', to: "posts#edit"
  patch 'posts/edit/:id', to: "posts#edit"

  get "posts/delete/:id", to: "posts#delete"

  
  
  
end
