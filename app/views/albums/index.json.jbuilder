json.array!(@albums) do |album|
  json.extract! album, :id, :label_id, :title, :artist, :genre, :year, :added, :plays
  json.url album_url(album, format: :json)
end
