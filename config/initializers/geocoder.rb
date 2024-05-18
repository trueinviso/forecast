Geocoder.configure(
  timeout: 5,
  lookup: :location_iq,
  api_key: Rails.application.credentials.location_iq_api_key,
  units: :mi,
  cache: Redis.new,
  cache_prefix: "geocoder:",
  always_raise: :all,
  distances: :linear,
)
