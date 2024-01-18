REBAR ?= rebar

.PHONY: all deps compile clean test ct

all: deps compile

deps:
	$(REBAR) get-deps


compile:
	$(REBAR) compile

clean:
	$(REBAR) clean
	rm -f test/*.beam
	rm -f erl_crash.dump
	rm -rf deps/
	rm -rf ebin/
	rm -rf _build/

test:
	TEST=true $(REBAR) get-deps
	TEST=true $(REBAR) compile
	TEST=true $(REBAR) eunit skip_deps=true
