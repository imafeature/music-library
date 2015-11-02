json.array!(@artists) do |artist|
  json.extract! artist, :id, :label_id, :name, :founded
  json.url artist_url(artist, format: :json)
end
