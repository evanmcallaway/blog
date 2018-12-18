Rails.application.routes.draw do
  
  devise_for :users, skip: :registration
  get 'welcome/index'

  resources :articles

  root 'articles#index'
end
