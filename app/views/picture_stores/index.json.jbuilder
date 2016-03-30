json.array!(@picture_stores) do |picture_store|
  json.extract! picture_store, :id, :store_name, :picture
  json.url picture_store_url(picture_store, format: :json)
end
