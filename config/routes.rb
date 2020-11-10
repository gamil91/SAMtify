Rails.application.routes.draw do
  resources :playlist_songs
  resources :songs
  resources :artists
  resources :playlists
  resources :users

  get '/signup', to: 'users#new', as: 'signup'
  get '/', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy' 
  patch '/songs', to: 'songs#index', as: 'sort_songs'

  resources :songs do
    resources :playlist_songs, shallow: true
  end

  resources :playlists do
    resources :songs do
      resources :playlist_songs, shallow: true
    end
  end

end
