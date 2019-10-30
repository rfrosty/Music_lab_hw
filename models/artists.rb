require('pg')
require_relative('albums')

class Artists

  attr_reader :artist_name, :id

  def initialize(options)
    @artist_name = options['artist_name']
    @id = options['id'].to_i if options['id']
  end

  def save
    db = PG.connect( {
      dbname: 'music_lab',
      host: 'localhost'
      })
    sql = "INSERT INTO artists (
    artist_name
    )
    VALUES
    (
      $1
    )
    RETURNING id;"
    values = [@artist_name]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]['id'].to_i

  end


end
