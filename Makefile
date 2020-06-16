all: brew install

brew:
	brew bundle --no-lock

install: brew
	git init
	pre-commit uninstall
	pre-commit install -f
	tfenv install

test:
	go get -u golang.org/x/lint/golint
	go get -u github.com/gruntwork-io/terratest/modules/terraform
	go get -u github.com/stretchr/testify/assert
	go test -t 30m -v ./test/example_test.go

.PHONY: brew install test
