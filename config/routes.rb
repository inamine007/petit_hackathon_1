Rails.application.routes.draw do
  root to: 'sessions#new'
  # get 'pages/top'
  get '/signup', to: 'users#new'  # => このルーティング要る？

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users    # usersテーブルに登録したユーザーのページ
end
