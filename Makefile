.PHONY: all
all:
	echo nop

opencode/bun-release-key.asc:
	./bin/get-bun-release-key > opencode/bun-release-key.asc

.PHONY: build/opencode
build/opencode: opencode/bun-release-key.asc
	cd opencode && ( echo '{}' | podman build --authfile=/dev/stdin -t localhost/opencode . )
