Rails.application.routes.draw do
  get 'users/index'
  put 'users/:id', to: 'users#toggle_admin', as: 'admin'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :histories

  root "histories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
