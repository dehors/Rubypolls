json.array! @polls do |poll|
  json.partial! "api/v1/resource", resource: poll
end
