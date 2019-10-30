require("pry")
require_relative("../models/artists")
require_relative("../models/albums")


artist1 = Artists.new( {'artist_name' => 'Jimmy Hendrix'})
artist1.save

album1 = Albums.new ({'album_name' => 'Woodstock', 'genre' => 'rock', 'artist_id' => artist1.id})
album1.save
