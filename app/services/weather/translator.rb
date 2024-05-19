module Weather
  module Translator
    extend self

    def call(data)
      {
        temperature: data["current"]["temperature_2m"],
        daily_high: data["daily"]["temperature_2m_max"],
        time: data["daily"]["time"],
      }
    end
  end
end
