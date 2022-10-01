Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  get 'posts/show'
  get 'posts/index'
  get 'comments/create'
  get 'comments/destroy'
  get '/signup', to: 'users#new'

  root to: 'posts#index'
  # get 'pages/top'
  get '/signup', to: 'users#new'  # => このルーティング要る？

  get '/login', to: 'sessions#new'  #=> コンフリクト?。
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users    # usersテーブルに登録したユーザーのページ
  resources :posts

  # 画像とコメント、お気に入りを紐づけるルーティング
  resources :posts do
    resources :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

end
