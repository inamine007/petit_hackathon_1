class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #引数で渡されたユーザidがFavoritesテーブル内に存在するかどうかを調べるメソッド
  def favorited_by?(user)
    # favorites.where(user_id: user.id).exists?と同じ
    favorites.exists?(user_id: user.id)
  end
  
  validates :title, presence: true
  validates :image, presence: true  
end