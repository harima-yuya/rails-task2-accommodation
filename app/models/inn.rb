class Inn < ApplicationRecord
    belongs_to:user
    has_many :reserve
    mount_uploader :innImage, AvatarUploader
   
    validates :innName,presence: {message: "ルーム名は必須項目です"}
    validates :innArea,presence: {message: "住所は必須項目です"}
    validates :innPrice,presence: {message: "料金は必須項目です"}
    validates :innMemo,presence: {message: "ルーム紹介は必須項目です"}
    validates :innImage,presence: {message: "画像は必須項目です"}
end
