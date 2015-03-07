json.array!(@exhibits) do |exhibit|
  json.extract! exhibit, :id, :name, :start_at, :end_at, :url, :belongs_to
  json.url exhibit_url(exhibit, format: :json)
end
