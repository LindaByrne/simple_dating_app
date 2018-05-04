Rails.application.routes.draw do
  get 'sessions/new/:uid', to: 'sessions#new'
  get 'static_pages/login'
  post 'oauth/validate', to: 'oauth#validate'
end
