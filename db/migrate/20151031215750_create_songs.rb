class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.integer :year
      t.date :added
      t.integer :plays

      t.timestamps null: false
    end
  end
end
