Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :rooms
  resources :users

  resources :rooms do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'rooms#index'

mount ActionCable.server => '/cable'

end
