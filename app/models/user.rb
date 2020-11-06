class User < ApplicationRecord
    has_secure_password
    has_many :playlists
    validates :username, uniqueness:true, length:{in: 4..12}
    validates :username, :name, :password, presence:true
end
