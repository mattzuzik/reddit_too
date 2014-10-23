json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :comment, :time_created, :expiration_date, :hx_votes
  json.url link_url(link, format: :json)
end
