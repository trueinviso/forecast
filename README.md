# Weather Forecast Application

## Overview

The Weather Forecast Application is a Ruby on Rails application that fetches and displays weather forecasts for given addresses. It uses geocoding to convert addresses into latitude and longitude coordinates and then retrieves weather data using open-meteo weather API. The application caches the weather data to reduce the number of API calls and improve performance.

## Features

- Convert addresses to geographic coordinates using the Geocoder gem and LocationIQ Geocoding API.
- Fetch weather forecast data from open-meteo weather API based on geographic coordinates.
- Cache weather forecast responses by zip code for 30 minutes to reduce API calls.
- Display weather forecast information for specified addresses.

## Installation

### Prerequisites

- Ruby 3.1.1
- Rails 7.1.3

### Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/trueinviso/forecast.git
    cd forecast
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. Enable caching in development:

    ```bash
    rails dev:cache
    ```

## Usage

1. Start the Rails server:

    ```bash
    bin/dev
    ```

2. Open your web browser and navigate to `http://localhost:3000`.

3. You can create new addresses and view weather forecasts for those addresses.
