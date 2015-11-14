class UserLabels < ActiveRecord::Migration
  def self.up
    create_table :user_labels, id: false do |t|
		  t.references :user, null: false
		  t.references :labels, null: false
		  t.integer :user_id
		  t.integer :label_id
	  end

  	add_index(:user_labels, [:user_id, :label_id], :unique => true)
  end

  def self.down
    drop_table :user_labels
  end
end

