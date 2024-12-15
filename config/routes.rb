Rails.application.routes.draw do
  # Route for registration form and submission
  get "register", to: "registrations#new", as: :register
  post "register", to: "registrations#create"
  root "home#index"
  get "dashboard", to: "home#dashboard"
  resource :session
  resources :passwords, param: :token
  get "sign_in", to: "sessions#new", as: :sign_in
  get "sign_out", to: "sessions#destroy", as: :sign_out
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
