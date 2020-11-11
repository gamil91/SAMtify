class User < ApplicationRecord
    has_secure_password
    has_many :playlists, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
    has_many :artists, through: :subscriptions
    validates :username, uniqueness:true, length:{in: 4..12}
    validates :username, :name, :password, presence:true
end
