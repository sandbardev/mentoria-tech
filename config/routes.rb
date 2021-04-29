# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :service_check, only: :index

      mount Flipper::UI.app(Flipper) => '/feature_toggle'
    end
  end
end
