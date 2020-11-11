class ArtistsController < ApplicationController

    def index
        if params[:query]
            @artists = Artist.find_by_query(params[:query]) 
        elsif params[:sort]
            @artists = Artist.all.sort_by {|artist| artist.name}
        else
            @artists = Artist.all
        end

        if params[:sort] == "popularity"
            @artists = @artists.sort_by {|artist| artist.num_playlists}.reverse
        elsif params[:sort] == "a-z"
            @artists = @artists.sort_by {|artist| artist.name}
        elsif params[:sort] == "z-a"
            @artists = @artists.sort_by {|artist| artist.name}.reverse
        end
    end

    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs
    end
end
