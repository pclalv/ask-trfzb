static/pandp12p.pdf:
	curl -o static/pandp12p.pdf https://www.gutenberg.org/files/1342/old/pandp12p.pdf

.PHONY: test
test:
	bundle exec rspec

.PHONY: run
run:
	bundle exec rails server
