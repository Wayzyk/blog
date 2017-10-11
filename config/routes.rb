Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments do
      get 'reply' => 'comments#reply'
    end
  end

  resources :posts do
    resources :comments do
      member do
        put "like" => "comments#upvote"
        put "unlike" => "comments#downvote"
      end
    end
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'users' => 'users#create'

end
