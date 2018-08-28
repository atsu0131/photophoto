class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :image, presence: true

  has_many :favorites, dependent: :destroy

  belongs_to :user
  has_many :favorites_users, through: :favorites, source: :user
end
