Rails.application.routes.draw do
  root 'home#index'
  resources :local_records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
