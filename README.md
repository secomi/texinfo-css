# texinfo-css

Custom CSS based on GNU manusl CSS style available at: 
- https://www.gnu.org/software/gnulib/manual.css
- https://www.gnu.org/style.css 


It adds: 
 - code synthax highlighting with GNU source-highlight
 - admonition for Note, Important, Warning
 
## Usage 
Generage the output with:

```bash
makeinfo --html --css-ref=manual.css --no-split -o manual.html  manual.texi
```

## Quick preview
To preview the output, uses https://htmlpreview.github.io, linke being:

<https://htmlpreview.github.io/?https://github.com/secomi/texinfo-css/blob/main/manual-css-html/manual.html>


## Similar projects
- <https://luis-felipe.gitlab.io/texinfo-css/>
