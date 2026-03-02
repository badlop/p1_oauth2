REBAR ?= rebar3

all: deps src

deps:
	$(REBAR) get-deps

src:
	$(REBAR) compile

clean:
	$(REBAR) clean

distclean: clean
	rm -f test/*.beam
	rm -f erl_crash.dump
	rm -rf deps/
	rm -rf ebin/
	rm -rf _build/

test: eunit xref dialyzer

eunit: all
	$(REBAR) eunit -v

xref: all
	$(REBAR) xref

dialyzer: all
	$(REBAR) dialyzer


.PHONY: all deps src clean distclean test xref dialyzer eunit
