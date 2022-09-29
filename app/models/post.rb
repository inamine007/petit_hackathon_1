class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  default_scope -> { order(created_at: :desc ) }
  has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true  
  validates :user_id, presence: true
  
end