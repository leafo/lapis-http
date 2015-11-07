local: build
	luarocks make --local *-dev-1.rockspec

build:
	-rm $$(find lapis -type f | grep '\.lua$$')
	moonc lapis
	moonc *.moon

lint::
	moonc lint_config.moon
	git ls-files | grep '\.moon$$' | grep -v config.moon | xargs -n 100 moonc -l

