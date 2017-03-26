Rails.application.routes.draw do
  devise_for :users
  root to: 'searches#show'

  namespace :admin do
    resources :railway_stations do
      member do
        patch :position
        patch :time
      end
    end

    resources :trains do
      resources :carriages, shallow: true, except: :index
    end

    resources :routes
  end

  resources :trains, only: [] do
    resources :tickets, shallow: true, only: [:show, :new, :create]
  end
  resource :search, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
