all: brew install

brew:
	brew bundle --no-lock

install: brew
	git init
	pre-commit uninstall
	pre-commit install -f
	tfenv install
	GO111MODULE=off go get -u golang.org/x/lint/golint

test:
	cd test; go mod download
	cd test; go test -timeout 2h -v

.PHONY: brew install test
