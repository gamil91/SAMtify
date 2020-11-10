class ArtistsController < ApplicationController

    def index
        if params[:query]
            @artists = Artist.find_by_query(params[:query]) 
        elsif params[:sort]
            @artists = Artist.all.sort_by {|artist| artist.name}
        else
            @artists = Artist.all
        end
    end

    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs
    end
end
