class CreateArtistsAlbums < ActiveRecord::Migration
  def self.up
    create_table :artists_albums, id: false do |t|
	  t.references :albums, null: false
  	  t.references :artists, null: false
  	  t.integer :album_id
  	  t.integer :artist_id
  end

  # Add an unique index for better join speed!
  add_index(:artists_albums, [:album_id, :artist_id], :unique => true)
  end

  def self.down
    drop_table :artists_albums
  end
end
