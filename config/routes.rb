Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "courses#index"
  get 'courses/about'
  get 'users/home'
  get 'bookings/homepage'
  resources :courses
  resources :users
  resources :categories
  resources :bookings


  resources :courses do 
    resources :bookings
  end
end
