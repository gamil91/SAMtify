class PlaylistSongsController < ApplicationController
    before_action :require_login
    def new
        @playlist_song = PlaylistSong.new
        @playlists = Playlist.all
        @song = Song.find(params[:song_id])
    end

    def create
        @playlist_song = PlaylistSong.new(playlist_id: params[:playlist_song][:playlist_id], song_id: params[:song_id])
        if @playlist_song.save
            redirect_to @playlist_song.playlist
        else
            render :new
        end
    end

    private
    def playlist_song_params
        params.require(:playlist_song).permit(:playlist_id, :song_id)
    end
end
