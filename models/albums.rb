require('pg')
require_relative('artists')
require_relative('../db/sql_runner')

class Albums

  attr_reader :id, :album_name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @album_name = options['album_name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

    def save
      db = PG.connect( {
        dbname: 'music_lab',
        host: 'localhost'
        })
      sql = "INSERT INTO albums (
      album_name,
      genre,
      artist_id
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id;"
      values = [@album_name, @genre, @artist_id]
      returned_array = SqlRunner.run(sql, values)
      albums_hash = returned_array[0]
      id_string = albums_hash['id']
      @id = id_string.to_i
    end


  end
