lapis = require "lapis"

class extends lapis.Application
  "/": =>
    method = @params.method or "GET"
    url = assert @params.url

    http = require "lapis.nginx.http"

    json: {
      http.simple url
    }

