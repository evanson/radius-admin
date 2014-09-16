json.array!(@radchecks) do |radcheck|
  json.extract! radcheck, :id
  json.url radcheck_url(radcheck, format: :json)
end
