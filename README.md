# Realtime Search Engine Demo

A simple Ruby on Rails application that provides a realtime search feature using an API endpoint.

## Requirements
- Ruby 3.1.4
- Rails 7.x

## Installation

```bash
# Clone the repository
git clone https://github.com/elbadawyy/realtime-search-demo.git

cd realtime_search_engine_demo

# Install dependencies
bundle install

# Setup the database
rails db:create db:migrate

# Start the server
rails server

API Usage
Search Endpoint
GET /api/search

Query Parameters:

query (string) — The search keyword.

ip (string, optional) — Client IP address.

Example Request:

curl "http://localhost:3000/api/search?query=ruby&ip=127.0.0.1"
Example Response:


[
  {
    "id": 1,
    "query_string": "ruby",
    "ip": "127.0.0.1",
    "created_at": "2025-08-10T12:34:56Z"
  }
]
