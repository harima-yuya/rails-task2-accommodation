class User < ApplicationRecord
  has_many :inn
  mount_uploader :image, AvatarUploader

  validates :name,presence: {message: "名前は必須項目です"}
  validates :image,presence: {message: "画像は必須項目です"}
  validates :comment,presence: {message: "自己紹介は必須項目です"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
