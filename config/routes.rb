Rails.application.routes.draw do
  get '/signup/:google_user_id', to: 'users#new'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#new'
end
