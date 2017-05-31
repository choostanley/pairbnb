json.extract! listing, :id, :user_id, :name, :description, :price, :num_of_bed, :address, :created_at, :updated_at
json.url listing_url(listing, format: :json)
