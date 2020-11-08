class PlaylistSongsController < ApplicationController

    def new
        @playlist_song = PlaylistSong.new
        @playlists = Playlist.all
        @song = Song.find(params[:song_id])
    end

    def create
        @playlist_song = PlaylistSong.new(playlist_id: params[:playlist_song][:playlist_id], song_id: params[:song_id])
        if !is_authorized?
            not_authorized
        else
            if @playlist_song.save
                redirect_to @playlist_song.playlist
            else
                render :new
            end
        end
    end

    def destroy
        @playlist_song = PlaylistSong.find(params[:id])
        if !is_authorized?
            not_authorized
        else
            @playlist = Playlist.find(params[:playlist_id])
            @playlist_song.destroy
            redirect_to @playlist
        end
    end

    private
    def playlist_song_params
        params.require(:playlist_song).permit(:playlist_id, :song_id)
    end

    def is_authorized?
        @playlist_song.playlist.user == current_user
    end

    def not_authorized
        redirect_to playlists_path
        flash[:danger] = "You don't own this playlist!"
    end
end
