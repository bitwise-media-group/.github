# This repository is GitHub Actions YAML + Markdown only — there is nothing to compile.
# The reusable release workflow's publish job runs `make build` unconditionally when a
# release is cut, so this no-op target exists purely to satisfy that contract (the same
# `build` target every consuming repo provides). No CI pipeline runs here, so the
# `test` / `e2e` targets that CI would call are intentionally absent.

.PHONY: build
build: ## no-op: nothing to build
	@:
