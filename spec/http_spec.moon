
ltn12 = require "ltn12"

listen = ->
  import get_free_port from require "lapis.cmd.util"
  port = get_free_port!
  handle = assert io.popen "moon quick_server.moon #{port}", "r"

  while true
    c = socket.connect "127.0.0.1", port
    if c
      c\close!
      break

    socket.sleep 0.001

  port, ->
    with handle\read "*a"
      handle\close!


describe "lapis.http", ->
  describe "socket", ->
    it "should make a GET request", ->
      port, read = listen!
      http = require "socket.http"

      _, status = http.request {
        url: "http://127.0.0.1:#{port}/hello"
        headers: {
          "X-Hello": "world"
        }
      }

      assert.same 200, status
      assert read!

