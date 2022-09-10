Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  resources :users    # usersテーブルに登録したユーザーのページ
end
