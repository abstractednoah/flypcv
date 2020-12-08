% Author: Noah D. Ortiz <analyticalnoa@gmail.com>
% Component of the flypcv package.
% Public repo available at github.com/abstractednoah/flypcv.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{flypcv}[2020/12/07]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

% 'makeat' commands.
\newcommand{\AL}{\makeatletter}
\newcommand{\AO}{\makeatother}


%
% Required packages.
%
\RequirePackage{hyperref}
\RequirePackage{xifthen}
\RequirePackage{calc}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{titlesec}


%
% Basic setup.
%

% Default font.
\renewcommand{\familydefault}{\sfdefault}
% Setup 'hyperref' package.
\hypersetup{colorlinks, urlcolor=blue, linkcolor=black}


%
% Helper macros.
%

% 'thisifthat'
%   Expand #1 if #2 is not empty.
\newcommand{\thisifthat}[2]{%%
    \ifthenelse{\isempty{#2}}{}{#1}%%
}


%
% Setup geometry.
%

% Remove parindent, parskip.
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

% Set vertical spacing.
\newlength{\fcvTitleHeight}         \setlength{\fcvTitleHeight}{0.5in}
\newlength{\fcvSpaceAboveSection}   \setlength{\fcvSpaceAboveSection}{15pt}
\newlength{\fcvSpaceBelowSection}   \setlength{\fcvSpaceBelowSection}{10pt}
\newlength{\fcvSpaceAboveHeader}    \setlength{\fcvSpaceAboveHeader}{5pt}

% Set margin and footer geometry.
\setlength{\footskip}{0.2in}
\geometry{margin=0.7in}


%
% Format header, footer.
%

% Set 'fancyhdr' pagestyle.
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhf{}
\fancyfoot[R]{\scriptsize \thepage\ \textit{of}\ \pageref{LastPage}}
\fancyfoot[L]{\itshape\scriptsize curriculum vitae}


%
% Format title.
%

% Title parameters:
% 'author', 'title', 'location', 'email', 'phone'
\author{Name}
% 'title' - Person's title, e.g. major or occupation.
\title{title}
% Data variables.
\AL{}
\newcommand{\@location}{New York City, NY, USA}
\newcommand{\@email}{email@domain.com}
\newcommand{\@phone}{123/456-7890}
% Setters.
\newcommand{\location}[1]{\renewcommand{\@location}{#1}}
\newcommand{\contact}[1]{\renewcommand{\@contact}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\AO{}

% 'maketitle'
%   Place the title within document.
%   (Hijacks LaTeX's default 'maketitle'.)
\AL{}
\renewcommand{\maketitle}{
    \begin{minipage}[t][\fcvTitleHeight][t]{0.5\textwidth}
        \flushleft{{\Huge\bfseries%%
            \@author%%
        }}
        \vspace{-5pt}\flushleft{{\itshape%%
            \@title%%
        }}
    \end{minipage}
    \begin{minipage}[t][\fcvTitleHeight][t]{0.5\textwidth}
        \flushright{%%
            \@location\\%%
            \href{mailto:\@email}{\@email} | \@phone%%
        }
    \end{minipage}
}
\AO{}

% 'rehdr'
%   Renew headers after geometry change.
\AL{}
\ifcsname f@nch@setoffs\endcsname\else
    \let\f@nch@setoffs\fancy@setoffs
\fi
\newcommand{\rehdr}{\f@nch@setoffs}
\AO{}


%
% Format sections.
%
\titleformat{\section}
    {\Large\bfseries\uppercase}
    {}
    {0pt}
    {}
    [\titlerule]
\titlespacing*{\section}
    {0pt}
    {\fcvSpaceAboveSection}
    {\fcvSpaceBelowSection}


%
% Item macros.
%

% 'fcvBlurb'
%   A simple italic paragraph for brief descriptions below main items or as
%   standalones.
\newcommand{\fcvBlurb}[1]{\par{\itshape#1}}


% Depricated for now.
% default metaformat
%\newcommand{\@defaultmetaformat}{\sffamily\small}
%\newcommand{\defaultmetaformat}[1]{\renewcommand{\@defaultmetaformat}{#1}}


% Format default bullet.
% Data variables.
\AL{}
\newcommand{\@fcvBullet}{$\cdot$\ }
\newlength{\fcvBulletWidth} \setlength{\fcvBulletWidth}{\widthof{\@fcvBullet}}
% Setter.
\newcommand{\fcvBullet}[1]{%%
    \renewcommand{\@fcvBullet}{#1}%%
    \setlength{\fcvBulletWidth}{\widthof{\@fcvBullet}}%%
}
\AO{}


% 'fcvItem'
%   Generic line item .
%   Arguments:
%       Item title.
%       Item info.
%       Item metadata (viz. dates).
%       Delimeter between title and info.
%       Punctuation after info.
%       Leading bullet.
\newcommand{\fcvItem}[6]{%%
    \par%%
    #6#1%%
    \thisifthat{#4}{#2}#2\thisifthat{#5}{#2}%%
    \thisifthat{\hfill}{#3}%%
    #3%%
    \par%%
}


% 'fcvNewItem'
%   Create a new custom cv item.
%   Arguments:
%       Command name.
%       Item format.
%       Info format.
%       Delimeter between title and info.
%       Punctuation after info.
%       Vertical space before.
%       Leading bullet.
%   Resulting cv item is a command with the following arguments:
%       Item title.
%       Item info.
%       Item metadata.
\newcommand{\fcvNewItem}[7]{%%
    \expandafter\newcommand\csname#1\endcsname[3]{%%
        \vspace{#6}%%
        \fcvItem%%
            {{#2##1}}%%
            {{#3##2}}
            {##3}%%
            {\thisifthat{#4}{##2}}%%
            {\thisifthat{#5}{##2}}%%
            {#7}%%
    }
}


%
% Create some custom cv items.
%

% 'fcvHeadItem'
%   For items that act as headers / major items.
\fcvNewItem{fcvHeadItem}{\bfseries}{}{ | }{}{\fcvSpaceAboveHeader}{}


% 'fcvDetailItem'
%   For detail items under 'fcvHeadItem'.
\AL{}
\fcvNewItem{fcvDetailItem}
    {}
    {\itshape}
    {:\ }
    {}
    {0pt}
    {\hspace{-0\fcvBulletWidth}\@fcvBullet}
\AO{}


% 'fcvCollection'
%   For a brief one-line list of items with emphasised header.
\fcvNewItem{fcvCollection}{\bfseries}{}{\ }{}{\fcvSpaceAboveHeader}{}


% 'fcvBlurbItem'
%   Item with blurb in-line (not actually a true 'fcvItem').
\newcommand{\fcvBlurbItem}[2]{%%
    \vspace{\fcvSpaceAboveHeader}\par%%
    {\bfseries#1}\ {\small\itshape#2}%%
}


% 'fcvReferenceItem'
%   A reference line (e.g. previous employer, etc.).
\fcvNewItem{fcvReferenceItem}
    {\rmfamily}
    {\itshape}
    {,\ }
    {}
    {\fcvSpaceAboveHeader}
    {}
