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
