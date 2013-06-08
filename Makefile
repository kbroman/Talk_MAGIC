figs = Figs/rqtl_lines_code.pdf Figs/rf_by_sim.pdf Figs/ri8.pdf Figs/3pt_markov4.pdf Figs/coincidence_8way.pdf Figs/fixation_time.pdf Figs/map_expansion.pdf Figs/threepoints.pdf

magic.pdf: magic.tex Figs/haldane_title.pdf Figs/haldane_selfing.png Figs/haldane_sibmating3.png Figs/ccmice.png $(figs)
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

Figs/3pt_markov4.pdf: R/colors.R R/ril_3pt.RData R/study_probs.R R/3pt_markov.R
	cd R;R CMD BATCH 3pt_markov.R

Figs/coincidence_8way.pdf: R/colors.R R/coincidence.Rdata.gz R/coinc_ri8.RData.gz R/coinc_8way_numerically.RData R/coincidence_fig.R
	cd R;R CMD BATCH coincidence_fig.R

Figs/fixation_time.pdf: R/colors.R R/fixation_time.R
	cd R;R CMD BATCH fixation_time.R

Figs/map_expansion.pdf: R/colors.R R/map_expansion_fig.R R/map_expansion_func.R
	cd R;R CMD BATCH map_expansion_fig.R

Figs/threepoints.pdf: R/colors.R R/3points.R
	cd R;R CMD BATCH 3points.R

clean:
	rm *~

cleanall:
	rm magic.pdf $(figs)
	rm *~

web: magic.pdf
	scp magic.pdf broman-2:public_html/presentations/

dropbox: ~/Dropbox/Talks/magic.pdf

~/Dropbox/Talks/magic.pdf: magic.pdf
	cp magic.pdf ~/Dropbox/Talks/

all: magic.pdf dropbox
