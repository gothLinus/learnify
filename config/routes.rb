Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
  authenticated :user do
    root to: "pages#index", as: :dashboard
  end

  unauthenticated do
    root to: "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new"
    get "/login" => "devise/sessions#new"
  end
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
