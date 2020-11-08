class ArtistsController < ApplicationController
    before_action :require_login
    def index
        if params[:query]
            @artists = Artist.find_by_query(params[:query])
        else
            @artists = Artist.all
        end
    end

    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs
    end
end
