json.array!(@museums) do |museum|
  json.extract! museum, :id, :name, :home_url, :exhibit_url
  json.url museum_url(museum, format: :json)
end
