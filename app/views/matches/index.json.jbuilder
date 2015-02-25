json.array!(@matches) do |match|
  json.extract! match, :id, :user_id_x, :user_id_o, :winner_id
  json.url match_url(match, format: :json)
end
