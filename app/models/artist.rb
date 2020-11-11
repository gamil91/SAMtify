class Artist < ApplicationRecord
    has_many :songs
    has_many :subscriptions
    has_many :users, through: :subscriptions

    def self.find_by_query(query_term)
        self.where("name LIKE ?", "%#{query_term}%")
    end

    def num_playlists
        self.songs.map do |song|
            song.playlists.length
        end.max
    end

end
