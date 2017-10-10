Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments do
      get 'reply' => 'comments#reply'
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'users' => 'users#create'

end
