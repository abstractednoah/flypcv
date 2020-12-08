# flypcv
A simple LaTeX documentclass for resumes.

Public repository at [GitHub](https://github.com/abstractednoah/flypcv).


## Required Packages

This class makes use of the standard `article.cls`, which should be installed by
default. In addition, the following packages are required:

* hyperref.sty
* xifthen.sty
* calc.sty
* geometry.sty
* fancyhdr.sty
* lastpage.sty
* titlesec.sty

All of these are available over at [ctan](https://ctan.org) or via your system's
package manager (hint: use `apt-file` on Debian systems).


## Installation

For portable installation, simply include the [`flypcv.cls`](flypcv.cls) file in
the same directory as your tex document.
To install the documentclass site-wide, place `flypcv.cls` anywhere
within your `texmf/tex/latex` directory and then run

    texhash path/to/texmf

to update your package index.


## Usage

To implement this class, create a tex document and load the class with

    \documentclass{flypcv}

Then [configure](#configuration) the package as desired in the preamble, and
place

    \maketitle

directly after `\begin{document}` to construct the cv heading. See
[features](#features) for a list of available "Item" commands, which are used to
create formatted lines in your resume.
You can also [create your own Items](#custom-items).


## Configuration

The package provides the following fields to be used when creating the title:

* `\author`
* `\title` - Occupation, major, position, etc.
* `\location`
* `\email` - Formatted nicely as a hyperlink.
* `\phone`

The assumption is that all of these fields are nonempty.
If you don't want to use a particular field, you might want to create your own
`\maketitle` command; see the source code.

The package makes the following alterations to default geometry:

* Set `\parindent` and `\parskip` lengths to zero.
* Change the `\footskip` length and geometry package's `margin` option from
  their default values; see source code for exact values.
* Set `\headrulewidth` and `\footrulewidth` to zero.

In addition, flypcv defines the following lengths:

* `\fcvTitleHeight` - Height of the title box.
* `\fcvSpaceAboveSection` - Vertical space before section headings.
* `\fcvSpaceBelowSection` - Vertical space after section headings.
* `\fcvSpaceAboveHeader` - Vertical space above `\fcvHeadItem`.

See the source code for default lengths.
Shrinking these can help fit a tight resume onto one page, but make sure nothing
gets cut off!

The package's bullet character can be set with `\fcvBullet`; see the source code
for the default character.


## Features

Out of the box, flypcv provides the following features, which are enough for a
simple resume. See the [next section](#custom-items) for how to create your own
Items.

### Title

As metioned, the `\maketitle` command places the title, using the fields listed
above.

### Sections

The package formats section headings; use `\section` as usual.

### Item Commands

Item commands are meant to print a single line (or wrap to the next if you have
too much text!) of resume information.

They take the following three mandatory arguments (in the following order):

* _title_ - The primary name of the line item, to be bolded and placed at the
  begining of the line. You choose your own consistent format, but for example,
  could be "Librarian" or "Engineer at Intel" or whatever you want to be the
  eye-catcher of the line.
* _info_ - Additional brief info to be placed on the same line right after
  _title_. For instance, GPA, employer name, or hours spent per week.
* _metadata_ - Any metadata to be placed flush to the right side of the page,
  such as years spent on the job, or the phone number of a reference.

Here are the commands:

* `\fcvHeadItem`
* `\fcvDetailItem`
* `\fcvCollection`
* `\fcvReferenceItem`

They can be used however you want, depending on how you want your cv to look.
For example, I use `\fcvHeadItem` for job headings, and then `\fcvDetailItem`
for brief explanations of my role, accomplishments, etc. The `\fcvReferenceItem`
is supposed to be used for references.

### Other Commands

The `\fcvBlurb` command takes one argument and formats it as a simple italic
paragraph for brief descriptions or standalones such as your "objective".

The `\fcvBlurbItem` takes two arguments: _title_ and _blurb_.


## Custom Items

The `\fcvNewItem` can be used to create your own line Item commands.
See the source code for usage.
