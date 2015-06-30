# Copyright © 2015 Maxime Devos.
#
# Permission is granted to copy, distribute and/or modify
# this document under the terms of the GNU Free
# Documentation License, Version 1.3 or any later version 
# published by the Free Software Foundation; with no
# Invariant Sections, no Front-Cover Texts, and no Back-Cover
# Texts. A copy of the license is included in the section
# entitled “GNU Free Documentation License”.
evince ?= evince
inkscape ?= inkscape
fontforge ?= fontforge
ghostscript ?= ghostscript
xelatex ?= xelatex
gimp.pdf gimp.aux gimp.out gimp.toc : GNUmakefile gimp.tex FreeMono.otf FreeSans.otf FreeSansBold.otf FreeSansOblique.otf FreeSansBoldOblique.otf FreeSerif.otf FreeSerifBold.otf FreeSerifItalic.otf FreeSerifBoldItalic.otf
	echo q | $(xelatex) -draftmode gimp.tex
	echo q | $(xelatex) gimp.tex
%.dep : %.tex GNUmakefile
	-rm $@
	echo -n 'gimp.pdf : ' > $@
	cat $< | grep -E -o -e '\\includegraphics(\[.*\])?\{.*}' gimp.tex | grep -E -o '\{.*' | grep -E -o '\{[[:alnum:]/.()_\-]+}' | rev | cut -c 2- | rev | tr -d '\n' | sed "s/{/ /g" >> $@
-include gimp.dep
Free%.otf : freefont/sfd/Free%.sfd
	#AutoHint();
	$(fontforge) -lang=ff -c 'Open($$1); SelectAll(); AutoHint(); Generate($$2);' $< $@
Wilber-head.png : GNUmakefile Wilber-head-inkscape.svg
	$(inkscape) Wilber-head-inkscape.svg --export-png=Wilber-head.png -w1200 -h900
gimp-txt.pdf : gimp-txt.svg GNUmakefile
	$(inkscape) gimp-txt.svg --export-pdf=gimp-txt.pdf
%.pdf : %-svg.svg GNUmakefile
	$(inkscape) $< --export-pdf=$@
.PHONY : evince
evince : gimp.pdf;
	$(evince) gimp.pdf
.PHONY : clean
clean : ;
	$(MAKE) -C freefont clean
	-rm -f -r *.aux *.idx *.log *.out *.pdf *.toc *.otf png-preview
#optioneel
png-preview :
	mkdir png-preview
png-preview/page-%.png : png-preview GNUmakefile gimp.pdf
	echo $(subst .png,,$(subst png-preview/page-,,$@))
	$(ghostscript) -r120 -dBATCH -dNOPAUSE -sDEVICE=png16m \
	 -dFirstPage=$(subst .png,,$(subst png-preview/page-,,$@))\
	 -dLastPage=$(subst .png,,$(subst png-preview/page-,,$@))\
	 -o png-preview/page-$(subst .png,,$(subst png-preview/page-,,$@)).png \
	 gimp.pdf
