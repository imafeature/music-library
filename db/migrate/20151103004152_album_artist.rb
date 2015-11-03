class AlbumArtist < ActiveRecord::Migration
  def self.up
    create_table :album_artist, id: false do |t|
	  t.references :album, null: false
  	  t.references :artist, null: false
  	  t.integer :album_id
  	  t.integer :artist_id
  end

  # Add an unique index for better join speed!
  add_index(:album_artist, [:album_id, :artist_id], :unique => true)
  end

  def self.down
    drop_table :album_artist
  end
end
