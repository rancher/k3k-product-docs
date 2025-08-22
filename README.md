# k3k-product-docs

Building using local playbook, UI fetching, and link validation using log-level info:

npx antora --fetch rke2-local-playbook.yml --log-level info

Build content only after initial UI fetch:

npx antora rke2-local-playbook.yml

Running site using local playbook:

npx http-server build/site -c-1

## Extentions

* Mermaid (Diagrams): https://github.com/snt/antora-mermaid-extension
* Tabs: https://github.com/asciidoctor/asciidoctor-tabs/blob/main/docs/use-with-antora.adoc 
