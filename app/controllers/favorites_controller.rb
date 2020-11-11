class FavoritesController < ApplicationController

    def create
        favorite = current_user.favorites.build(playlist_id: params[:playlist_id])
        favorite.save
        redirect_to playlists_path
    end

    def destroy
        favorite = Favorite.all.find(params[:id])
        favorite.delete
        redirect_to playlists_path
    end

end
