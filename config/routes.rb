Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root "courses#index"
  get 'courses/about'
  get 'users/home'
  resources :courses
  resources :users
  resources :categories
  resources :bookings


  resources :courses do 
    resources :bookings
  end
end
