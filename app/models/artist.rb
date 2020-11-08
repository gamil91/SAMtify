class Artist < ApplicationRecord
    has_many :songs

    def self.find_by_query(query_term)
        self.where("name LIKE ?", "%#{query_term}%")
    end
end
