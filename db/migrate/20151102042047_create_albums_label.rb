class CreateAlbumsLabel < ActiveRecord::Migration
  def self.up
    create_table :albums_label, id: false do |t|
	    t.references :albums, null: false
  	  t.references :label, null: false
  	  t.integer :album_id
  	  t.integer :label_id
  end

  # Add an unique index for better join speed!
  add_index(:albums_label, [:album_id, :label_id], :unique => true)
  end

  def self.down
    drop_table :albums_label
  end
end
