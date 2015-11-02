json.array!(@songs) do |song|
  json.extract! song, :id, :title, :genre, :year, :added, :plays
  json.url song_url(song, format: :json)
end
