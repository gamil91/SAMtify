class SongsController < ApplicationController
    
    def index
        if params[:query]
            @songs = Song.find_by_query(params[:query])
        else
            @songs = Song.all
        end

        if params[:playlist_id]
            @playlist_id = params[:playlist_id]
        end
    end

    def show
        @song = Song.find(params[:id])
        if params[:playlist_id]
            @playlist_id = params[:playlist_id]
        end
    end
end
