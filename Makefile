.DEFAULT_GOAL = test

lint:
	@luacheck lua/lualine
	@luacheck tests

format:
	@for file in `find -name '*.lua'`;do lua-format $$file -i; done;

test:
	@make lint
	@nvim --headless -u tests/minimal_init.lua -c "PlenaryBustedDirectory tests/ { minimal_init = './tests/minimal_init.lua' }"

all: lint
