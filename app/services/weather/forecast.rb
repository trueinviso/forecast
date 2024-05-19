module Weather
  class Forecast
    def initialize(address)
      @address = address
      @client = Weather::Client.new
    end

    def call
      return if address.latitude.blank? || address.longitude.blank?

      @from_cache = true

      Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
        @from_cache = false
        Translator.call(json)
      end
    end

    def from_cache?
      from_cache
    end

    private

    attr_reader :client, :address, :from_cache

    def json
      JSON.parse(client.get("forecast", params).body)
    end

    def params
      {
        latitude: address.latitude,
        longitude: address.longitude,
        temperature_unit: "fahrenheit",
        current: "temperature_2m",
        daily: "temperature_2m_max",
      }
    end

    def cache_key
      "weather/forecast/#{address.postal_code}"
    end
  end
end