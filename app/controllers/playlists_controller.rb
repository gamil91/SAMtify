class PlaylistsController < ApplicationController
    before_action :get_playlist, only: [:show, :edit, :update, :destroy]

    def index
        @playlists = Playlist.all
    end

    def show
    end

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(playlist_params)
        if @playlist.save
            redirect_to @playlist
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @playlist.update(playlist_params)
            redirect_to @playlist
        else 
            render :edit
        end
    end

    def destroy
        @playlist.destroy
        redirect_to playlists_path
    end

    private

    def get_playlist
        @playlist = Playlist.find(params[:id])
    end

    def playlist_params
        params.require(:playlist).permit(:name, :user_id)
    end

end
