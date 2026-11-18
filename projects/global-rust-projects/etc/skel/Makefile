##
# Makefile
##

##
# help: Display this help message.
##
.PHONY: help
help:
        @awk '/^##/{a=1-a}a' $(MAKEFILE_LIST) | cut -c3-

# newline: This is a print helper when you want to embed a newline in a message.
define newline


endef

##
# make benchmarks: run bin/benchmarks to generate code benchmarks with criterion.
##
.PHONY: benchmarks
benchmarks:
	bin/benchmarks

##
# make build: run bin/build to build everything.
##
.PHONY: build
build:
	bin/build

##
# make check: run bin/check to check everything.
##
.PHONY: check
check:
	bin/check

##
# make ci: run bin/ci to do continuous integration.
##
.PHONY: ci
ci:
	bin/ci

##
# make clean: run bin/clean to clean everything.
##
.PHONY: clean
clean:
	bin/clean

##
# make coverage: : run bin/coverage to generate code coverage analysis with tarpaulin.
##
.PHONY: coverage
coverage:
	bin/coverage

##
# make test: run bin/test to test everything.
##
.PHONY: test
test:
	bin/test
