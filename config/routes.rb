Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true, except: :index
  end
  resources :railway_stations do
    patch :position, on: :member
  end
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
