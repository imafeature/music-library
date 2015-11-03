class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :active_from
      t.integer :active_until

      t.timestamps null: false
    end
  end
end
