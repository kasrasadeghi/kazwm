runcmd=build/app/kazwm
threads=8

PROJECT_NAME=kazwm

.PHONY: default
default: run

.PHONY: build
build:
	@[[ -d build ]] || mkdir build
	@cd build; cmake -DGTEST=False ..; make -j${threads}

.PHONY: run\:%
run: build
	build/app/${PROJECT_NAME}

.PHONY: clean
clean:
	rm -rf build

### GDB ###

.PHONY: gdb
gdb: build
	gdb -q --args ${runcmd}

.PHONY: test-gdb
test-gdb: test-build
	gdb -q --args build/test/${PROJECT_NAME}_test --gtest_color=yes

### Google Test ###

.PHONY: test-build
test-build:
	@[[ -d build ]] || mkdir build
	cd build; cmake -DGTEST=True ..; make -j${threads}

.PHONY: test
test: test-build
	build/test/${PROJECT_NAME}_test --gtest_color=yes

.PHONY: test\:%
test\:%: test-build
	build/test/${PROJECT_NAME}_test --gtest_filter='*$**'

.PHONY: list-tests
list-tests: test-build
	build/test/${PROJECT_NAME}_test --gtest_list_tests
