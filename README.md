# flypcv
A simple, clean, and dynamic LaTeX documentclass for resume aka cv.

Public repository at [GitHub](https://github.com/analyticalnoa/flypcv).

Feel free to have a look at 
[my cv](https://github.com/analyticalnoa/analyticalnoa-cv) for a sample use of
this class.  

## Dependencies

This class makes use of the standard article.cls file, which should be installed
by default. In addition, the following packages are required.

* colorlinks.sty
* xifthen.sty
* geometry.sty
* fancyhdr.sty
* lastpage.sty
* titlesec.sty

All of these should be available over at [ctan](https://ctan.org) or via your
system's package manager (hint: use apt-file on Debian systems).

## Installation
For a portable installation, simply include the [flypcv.sty](flypcv.sty) file in
the same directory as your cv tex document.
To install the documentclass system-wide, place [flypcv.sty](flypcv.sty)
anywhere within your `texmf/tex/latex` directory and then run

    texhash path/to/texmf

to update your package index. 

Also be sure you have all of the [required packages](#Dependencies) installed.

## Use

To implement this class, create a tex document (say *cv.tex*) and
load [flypcv.sty](flypcv.sty) with

    \documentclass{flypcv}

You can begin specifying your header information in the preamble with the
`\author`, `\title`, `\location`, `\email`, and `\phone` commands. Then
`\begin{document}` and start the document with

    \maketitle,
    
this will construct the cv heading using the information specified in the
preamble.

Then you can start entering your resume contents. See
[features][#Features]) below for a list of all the available commands. You're
more than welcome to implement them as you see fit, but I had the following
structure in mind: Use `\section` to seperate your resume into the various
catagories such as "Education", "Employement", etc. Use `\headcvitem` for your
actual resume items such as "X Title at X Employer". And use `\detailcvitem` to
add the details to those head items, e.g. "Did such and such...". Additional
`cvitem` commands are also defined for things like references, etc; see below.

## Layout

This documentclass provides for a simple layout with a two-column title (name
left and contact info right)


## lengths

* \titleheight (default 0.5in) - height of title minipage
* \secabovespace (default 15pt) - space above sections
* \secbelowspace (default 10pt) - space below section title
* \headabovespace (default 5pt) - space above head items

* \footskip (default 0.2in) - read doc, not rly sure anymore
