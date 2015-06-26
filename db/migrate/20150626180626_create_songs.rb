class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|

      t.string "title"
      t.integer "user_id"
      t.integer "artist_id"
      t.integer "album_id"
      t.boolean "public", :default => false
      t.integer "duration"
      t.string "file"
      t.timestamps null: false

    end
    add_index("songs", "user_id")
    add_index("songs", "album_id")
    add_index("songs", "artist_id")
  end
end
