class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true #データベース上に、ユーザーのメールアドレスの一意性を制約
  end
end
