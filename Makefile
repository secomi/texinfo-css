SRC_EXAMPLES := ex_record.c

SRC_EXAMPLES_LNUM := ex_record.c

CSS := reset.css style.css manual.css
IMGS := gnu.svg

EXAMPLES_TEXI := $(patsubst %, %.texi, $(SRC_EXAMPLES))   # ex_record.c -> ex_record.c.texi
EXAMPLES_HTML := $(patsubst %, %.html, $(SRC_EXAMPLES))   # ex_record.c -> ex_record.c.html


EXAMPLES_LNUM_TEXI := $(SRC_EXAMPLES_LNUM:.c=.c.ln.texi)
EXAMPLES_LNUM_HTML := $(SRC_EXAMPLES_LNUM:.c=.c.ln.html) 

%.c.texi: %.c
	source-highlight -s c -f texinfo \
	-i $< -o $@

%.c.html: %.c
	source-highlight -s c -f html5 \
	--outlang-def=html5_examples.outlang \
	--style-css-file=modus-operandi.css \
	-i $< -o $@


%.c.ln.texi: %.c
	source-highlight -s c -f texinfo \
	--line-number \
	-i $< -o $@

%.c.ln.html: %.c
	source-highlight -s c -f html5 \
	--outlang-def=html5_examples.outlang \
	--line-number \
	--style-css-file=modus-operandi.css \
	-i $< -o $@



manual-css.tgz: manual.texi fdl.texi ex_record.c \
		Makefile $(CSS) $(IMGS) \
		html5_examples.outlang
	mkdir manual-css
	ln $^ manual-css
	tar czf manual-css.tgz manual-css
	rm -rf manual-css


# 2022-Sep-28 convert the image. Needs Gostscript >= 5.24
# otherwise the convertion is blocked by policy /etc/ImageMagick-6/policy.xml
gnu.pdf: gnu.svg
	convert $< $@

manual.info: manual.texi fdl.texi $(EXAMPLES_TEXI) $(EXAMPLES_LNUM_TEXI)
	makeinfo $<

# unicode char not properly displayed. 
# manual.pdf: manual.texi fdl.texi $(EXAMPLES_TEXI) $(EXAMPLES_LNUM_TEXI) gnu.pdf
# 	texi2pdf $<


manual.html: manual.texi fdl.texi $(EXAMPLES_HTML) $(EXAMPLES_LNUM_HTML) $(EXAMPLES_TEXI) \
	$(IMGS) $(CSS) html5_examples.outlang
	# makeinfo --html --css-ref=manual.css --no-split $< -o $@

	(makeinfo --html --css-ref=manual.css --no-split $< -o manual-css-html/ \
	&& cp $(IMGS) $(CSS) manual-css-html/)

	# (makeinfo --html --css-ref=manual.css $< -o manual-css-html/ \
	# && cp $(IMGS) $(CSS) manual-css-html/)


clean:
	$(RM) manual.html
	$(RM) $(EXAMPLES_TEXI) $(EXAMPLES_LNUM_TEXI) $(EXAMPLES_HTML) $(EXAMPLES_LNUM_HTML)
	$(RM) manual-css.tgz
	$(RM) gnu.pdf
	$(RM) manual.info
	$(RM) -r manual-css-html
