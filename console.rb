require('pry')
require_relative('models/artist')
require_relative('models/album')

Album.delete_all
Artist.delete_all

artist1 = Artist.new('name' => 'Kevin Kobain')
artist1.save

artist2 = Artist.new('name' => 'Courtney Love')
artist2.save

album1 = Album.new({
  'title' => 'Nevermind you got my name wrong',
  'genre' => 'folk',
  'artist_id' => artist1.id
  })


  album2 = Album.new({
    'title' => 'Smells like the wrong name',
    'genre' => 'folk',
    'artist_id' => artist1.id
    })


album1.save
album2.save
album2.genre = "metal"
album2.title = "Heartshape Box"
album2.update

album1.delete

artist1.name = "Keith Cobain"
artist1.update


    binding.pry
    nil
