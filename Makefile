.PHONY: start
start:
	go run main.go

.PHONY: debug
debug:
	dlv debug --headless --listen=:2345 --log --api-version=2

.PHONY: test
test:
	go test -p 4 -race -coverprofile=coverage.txt -covermode=atomic ./...

.PHONY: clean
clean:
	rm coverage.txt unit-test-dynamic-artifact.txt unit-test-static-artifact.txt e2e/e2e-result.txt raw-artillery-report.json visual-artillery-report.html
