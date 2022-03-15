Rails.application.routes.draw do
  get 'accounts/index'
  get 'accounts/login_check'
  devise_for :accounts
  resources :people
  get 'people/new/:account_id' ,to: 'people#new'
  resources :answers
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
