class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :label, index: true, foreign_key: true
      t.string :title
      t.references :artist
      t.string :genre
      t.integer :year
      t.date :added
      t.integer :plays

      t.timestamps null: false
    end
  end
end
