file = File.read("db/client_info.rb")
info = file.split
RSpotify.authenticate(info[0], info[1])

artist_arr = ["Adele", "Drake", "Ed Sheeran", "Lady Gaga", "Beyonce", "Taylor Swift"]

artists = artist_arr.map do |a|
    artist = RSpotify::Artist.search(a).first
    artist.related_artists + [artist]
end.flatten.uniq

artists.each do |artist|
    artist_obj = Artist.create(name: artist.name)
    artist.top_tracks(:US).each do |track|
        Song.create(artist: artist_obj, title: track.name)
    end
end
