Rails.application.routes.draw do
  
  root       'students#index'
  resources :students do
  	resources :subjects, only: [ :index, :show, :create, :edit, :update, :destroy]
  	resources :characteristics, only: [:show, :create, :edit, :update, :destroy]
    end
  
end
