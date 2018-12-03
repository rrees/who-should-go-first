
all: build

build: app.js

app.js: src/Decider.elm
	elm make src/Decider.elm --output build/app.js

deploy:
	cp build/app.js docs/app.js