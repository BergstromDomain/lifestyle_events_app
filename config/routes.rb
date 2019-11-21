Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "lifestyle_events#index"

  resources :names
  resources :lifestyle_events
  resources :lifestyle_event_types
end
