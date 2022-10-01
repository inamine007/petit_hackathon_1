class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  default_scope -> { order(created_at: :desc ) }
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true
  validates :image, presence: true  
  validates :user_id, presence: true
  
end