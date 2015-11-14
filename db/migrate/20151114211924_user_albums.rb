class UserAlbums < ActiveRecord::Migration
  def self.up
    create_table :user_albums, id: false do |t|
		  t.references :user, null: false
		  t.references :albums, null: false
		  t.integer :user_id
		  t.integer :album_id
	  end

  	add_index(:user_albums, [:user_id, :album_id], :unique => true)
  end

  def self.down
    drop_table :user_albums
  end
end