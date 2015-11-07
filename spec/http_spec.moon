
ltn12 = require "ltn12"

listen = ->
  import get_free_port from require "lapis.cmd.util"
  port = get_free_port!
  handle = assert io.popen "moon spec/quick_server.moon #{port}", "r"

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
  describe "lapis #lapis", ->
    import use_test_server from require "lapis.spec"
    import request from require "lapis.spec.server"

    use_test_server!

    it "should make a GET request", ->
      port, read = listen!
      status, res = request "/", {
        get: {
          url: "http://127.0.0.1:#{port}/hello"
        }
        expect: "json"
      }

      assert.same 200, status
      print (assert read!)

  describe "socket #luasocket", ->
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
      print (assert read!)

