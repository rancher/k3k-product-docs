product-local:
	bin/switch_prod_comm product
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		playbook-product-local.yml \
		2>&1 | tee tmp/product-local-build.log 2>&1

community-local:
	bin/switch_prod_comm community
	mkdir -p tmp
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		playbook-community-local.yml \
		2>&1 | tee tmp/community-local-build.log 2>&1
	bin/switch_prod_comm product ## Leave in a default state of product

product-remote:
	bin/switch_prod_comm product
	mkdir -p tmp
	npm ci
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		playbook-product-remote.yml \
		2>&1 | tee tmp/product-remote-build.log 2>&1

community-remote:
	bin/switch_prod_comm community
	mkdir -p tmp
	npm ci
	npx antora --version
	npx antora --stacktrace --log-format=pretty --log-level=info \
		playbook-community-remote.yml \
		2>&1 | tee tmp/product-remote-build.log 2>&1
	bin/switch_prod_comm product ## Leave in a default state of product

clean:
	rm -rf build*

environment:
	npm ci || npm install

preview:
	npx http-server build/site -c-1