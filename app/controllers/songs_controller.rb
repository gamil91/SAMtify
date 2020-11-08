class SongsController < ApplicationController
    before_action :require_login
    
    def index
        if params[:query]
            @songs = Song.find_by_query(params[:query])
        else
            @songs = Song.all
        end
    end

    def show
        @song = Song.find(params[:id])
    end
end
