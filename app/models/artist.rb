class Artist < ApplicationRecord
    has_many :songs

    def self.find_by_query(query_term)
        self.where("name LIKE ?", "%#{query_term}%")
    end

    def num_playlists
        self.songs.map do |song|
            song.playlists.length
        end.max
    end

end
