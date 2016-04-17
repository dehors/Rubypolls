json.array!(@questions) do |question|
  json.(questions, :id, :description)
end