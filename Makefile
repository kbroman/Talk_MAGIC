magic.pdf: magic.tex Figs/ri8.pdf Figs/rf_by_sim.pdf Figs/haldane_title.pdf Figs/haldane_selfing.png Figs/haldane_sibmating3.png Figs/haldane_sibmating4.png Figs/haldane_sibmating1.pdf Figs/haldane_sibmating2.pdf Figs/rqtl_lines_code.pdf
	pdflatex magic
	pdflatex magic
	rm magic.aux magic.log magic.out

Figs/ri8.pdf: R/ri8_fig.R R/colors.R R/for_ri8_fig.RData.gz
	cd R;R CMD BATCH ri8_fig.R

Figs/rf_by_sim.pdf: R/rf_by_sim.R R/colors.R R/ri8_onestep_rev.RData.gz
	cd R;R CMD BATCH rf_by_sim.R

Perl/lines_code_by_version.csv: Perl/grab_lines_code.pl Perl/versions.txt
	cd Perl;grab_lines_code.pl

Figs/rqtl_lines_code.pdf: R/colors.R Perl/lines_code_by_version.csv R/rqtl_lines_code.R
	cd R;R CMD BATCH rqtl_lines_code.R

clean:
	rm *~

cleanall: clean
	rm -r Figs/*.pdf magic.pdf

