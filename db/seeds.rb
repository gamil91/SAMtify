file = File.read("db/client_info.rb")
info = file.split
RSpotify.authenticate(info[0], info[1])

artist_arr = ["Adele", "Drake", "Ed Sheeran", "Lady Gaga", "Beyonce", "Taylor Swift"]

artists = artist_arr.map do |a|
    artist = RSpotify::Artist.search(a).first
    artist.related_artists + [artist]
end.flatten

artists = artists.uniq{|a| a.name}

artists.each do |artist|
    artist_obj = Artist.create(name: artist.name, image: artist.albums.first.images[1]["url"])
    artist.top_tracks(:US).each do |track|
        if track.preview_url != nil
            Song.create(artist: artist_obj, title: track.name, preview: track.preview_url, image: track.album.images[1]["url"])
        end
    end
end

Artist.all.each do |a|
    if a.songs.length == 0
        a.destroy
    end
end


