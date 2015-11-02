class CreateAlbumsArtists < ActiveRecord::Migration
  def self.up
    create_table :albums_artists, id: false do |t|
	    t.references :albums, null: false
  	  t.references :artists, null: false
  	  t.integer :album_id
  	  t.integer :artist_id
  end

  # Add an unique index for better join speed!
  add_index(:albums_artists, [:album_id, :artist_id], :unique => true)
  end

  def self.down
    drop_table :albums_artists
  end
end
