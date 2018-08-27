
TEXTOOL=pdflatex
BIBTOOL=bibtex
FORMAT=pdf
ARGS=-interaction=nonstopmode -halt-on-error
NLOOPS=2

SOURCES=*.tex
TARGETS=*.$(FORMAT)

# output control
NOISY=/dev/stderr
QUIET=/dev/null
FILE=build.log
OUTPUT=$(FILE)

all: $(SOURCES)

.PHONY : $(FORMAT)

%.tex: $(FORMAT)
	echo "\n\tOutputting LaTeX build log to \"${OUTPUT}\"...\n"
	$(TEXTOOL) $(ARGS) $@ &> ${OUTPUT}
	loop_count=$(NLOOPS) ; \
	while egrep -s 'Rerun (LaTeX|to get cross-references right)' `echo $@ | sed 's/.tex/.log/g'` && [ $$loop_count -gt 0 ] ;\
	    do \
		echo "Rerunning latex...." ; \
	      	$(TEXTOOL) $(ARGS) $@ &> ${OUTPUT}; \
	      	loop_count=`expr $$loop_count - 1` ; \
	    done
	$(TEXTOOL) $(ARGS) $@ &> ${OUTPUT}

compress: $(TARGETS)

%.pdf: $(FORMAT)
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=`echo $@ | sed 's/\.pdf/_compressed.pdf/g'` $@

.PHONY : clean

clean:
	@for dir in ./ sections data ; do \
		for ext in ps dvi aux toc idx ind ilg log out vrb brf lof lot blg bbl backup ~ snm nav fdb_latexmk fls ; do \
			rm -rf $$dir/*.$$ext ; \
		done ; \
	done

distclean:
	@for dir in ./ sections data ; do \
		for ext in ps dvi aux toc idx ind ilg log out vrb brf lof lot blg bbl backup ~ snm nav fdb_latexmk fls pdf ; do \
			rm -rf $$dir/*.$$ext ; \
		done ; \
	done
