REPORTER = dot

clean:
	rm -rf docs

test:
	@NODE_ENV=test ./node_modules/.bin/mocha -b -G -w \
	--compilers coffee:coffee-script \
	--reporter $(REPORTER) test

docs:
	rm -fr docs
	./node_modules/.bin/docco src/*.coffee

.PHONY: test docs