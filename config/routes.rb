Rails.application.routes.draw do
  
  resources :students do
  	resources :subjects
  	resources :characteristics
    end
  
end
