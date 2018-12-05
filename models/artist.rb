require('pg')
require_relative('../db/sql_runner')


class Artist

attr_reader :id
attr_accessor :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    # db = PG.connect({dbname: 'music_library', host: 'localhost'})
    sql = "INSERT INTO artists (name) VALUES($1) RETURNING id"
    values = [@name]
    # db.prepare("save", sql)
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
    # db.close()
  end

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map {|result| Artist.new(result)}
  end

def self.delete_all
  sql = "DELETE FROM artists"
  results = SqlRunner.run(sql)
end

end
