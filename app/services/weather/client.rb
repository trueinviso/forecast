module Weather
  class Client
    def get(path, params = {}, headers = nil)
      connection.get(path, params, headers)
    end

    private

    def connection
      @connection ||= Faraday.new(url: url)
    end

    def url
      "https://api.open-meteo.com/v1/"
    end
  end
end
