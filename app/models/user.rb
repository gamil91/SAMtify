class User < ApplicationRecord
    has_secure_password
    has_many :playlists, dependent: :destroy
    has_many :favorites, dependent: :destroy
    validates :username, uniqueness:true, length:{in: 4..12}
    validates :username, :name, :password, presence:true
end
