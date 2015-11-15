class LabelsUsers < ActiveRecord::Migration
  def self.up
    create_table :labels_users, id: false do |t|
		  t.references :user, null: false
		  t.references :labels, null: false
		  t.integer :user_id
		  t.integer :label_id
	  end

  	add_index(:labels_users, [:user_id, :label_id], :unique => true)
  end

  def self.down
    drop_table :labels_users
  end
end

