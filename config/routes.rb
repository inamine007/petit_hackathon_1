Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  resources :users    # usersテーブルに登録したユーザーのページ

  # 画像とコメントを紐づけるルーティング
  resources :posts do
    resources :comments, only: [:create]
  end
end
