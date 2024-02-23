install_deps:
	Rscript \
	-e 'if (!requireNamespace("remotes")) install.packages("remotes")' \
	-e 'remotes::install_deps(dependencies = TRUE)'

preview: install_deps
	quarto preview .

render: install_deps
	quarto render
