Rails.application.routes.draw do

  get 'welcome/index'

resources :books
resources :clients
resources :articles do

  member do
   get :download_pdf
  end
  resources :comments
end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
