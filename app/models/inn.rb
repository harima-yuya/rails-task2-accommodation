class Inn < ApplicationRecord
    belongs_to:user
    has_many :reserve
    mount_uploader :innImage, AvatarUploader
   
end
