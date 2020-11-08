class PlaylistsController < ApplicationController
    before_action :require_login
    before_action :get_playlist, only: [:show, :edit, :update, :destroy]

    def index
        @playlists = Playlist.all
    end

    def show        
        @playlist = Playlist.find(params[:id])        
        @songs = @playlist.playlist_songs.map {|ps| ps.song }    
    end
    
    def new
        @playlist = Playlist.new
        @user = User.find(params[:user_id])
    end

    def create
        @playlist = Playlist.new(user_id: params[:user_id], name: params[:playlist][:name])
        if @playlist.save
            redirect_to @playlist
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @playlist.update(name: params[:playlist][:name])
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
