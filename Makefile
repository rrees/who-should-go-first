
all: build

build: app.js

app.js: Decider.elm
	elm-make Decider.elm --output build/app.js

deploy:
	cp build/app.js docs/app.js