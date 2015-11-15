class ArtistsUsers < ActiveRecord::Migration
  def self.up
    create_table :artists_users, id: false do |t|
		  t.references :user, null: false
		  t.references :artists, null: false
		  t.integer :user_id
		  t.integer :artist_id
	  end

  	add_index(:artists_users, [:user_id, :artist_id], :unique => true)
  end

  def self.down
    drop_table :artists_users
  end
end