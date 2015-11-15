class AlbumsUsers < ActiveRecord::Migration
  def self.up
    create_table :albums_users, id: false do |t|
		  t.references :user, null: false
		  t.references :albums, null: false
		  t.integer :user_id
		  t.integer :album_id
	  end

  	add_index(:albums_users, [:user_id, :album_id], :unique => true)
  end

  def self.down
    drop_table :albums_users
  end
end