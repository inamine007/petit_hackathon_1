Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  resources :users    # usersテーブルに登録したユーザーのページ

  # 画像とコメント、お気に入りを紐づけるルーティング
  resources :posts do
    resources :comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
end
