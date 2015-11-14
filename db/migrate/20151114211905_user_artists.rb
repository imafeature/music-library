class UserArtists < ActiveRecord::Migration
  def self.up
    create_table :user_artists, id: false do |t|
		  t.references :user, null: false
		  t.references :artists, null: false
		  t.integer :user_id
		  t.integer :artist_id
	  end

  	add_index(:user_artists, [:user_id, :artist_id], :unique => true)
  end

  def self.down
    drop_table :user_artists
  end
end