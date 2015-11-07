package = "lapis-http"
version = "dev-1"

source = {
  url = "git://github.com/leafo/lapis-http.git"
}

description = {
  summary = "HTTP library wrangler for OpenResty & Lua",
  license = "MIT",
  maintainer = "Leaf Corcoran <leafot@gmail.com>",
}

dependencies = {
  "lua == 5.1",
  "lapis"
}

build = {
  type = "builtin",
  modules = {
		["lapis.http"] = "lapis/http.lua",
		["lapis.http.backends.lapis"] = "lapis/http/backends/lapis.lua",
		["lapis.http.backends.resty_http"] = "lapis/http/backends/resty_http.lua",
		["lapis.http.backends.socket"] = "lapis/http/backends/socket.lua",
  }
}

