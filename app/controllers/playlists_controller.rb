class PlaylistsController < ApplicationController

    def show
        @playlist = Playlist.find(params[:id])
        @songs = @playlist.playlist_songs.map {|ps| ps.song }
    end
end
