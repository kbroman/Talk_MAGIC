magic.pdf: magic.tex Figs/ri8.pdf
	pdflatex magic
	rm magic.aux magic.log

Figs/ri8.pdf: R/ri8_fig.R R/colors.R R/for_ri8_fig.RData.gz
	cd R;R CMD BATCH ri8_fig.R

clean:
	rm *~

cleanall: clean
	rm -r Figs/*.pdf magic.pdf

