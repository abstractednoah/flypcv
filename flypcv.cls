\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flypcv}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

\makeatletter

%%% hyperlinks --------------------------------------------------------------------------
\RequirePackage[colorlinks, urlcolor=cyan, linkcolor=black]{hyperref}
%%%%%%

%%% geometry, footer --------------------------------------------------------------------

% remove parindent
\setlength\parindent{0pt}

% set margin, footer geometry
\RequirePackage{geometry}

\setlength{\footskip}{0.2in}
\geometry{margin=0.7in}

% configure footer
\RequirePackage{fancyhdr, lastpage}

\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhf{}
\fancyfoot[R]{\sffamily\scriptsize \thepage\ \textit{of}\ \pageref{LastPage}}
\fancyfoot[L]{\sffamily\itshape\scriptsize curriculum vitae}

%%%%%%

%%% cvtitle -----------------------------------------------------------------------------

% supported header parameters
%   \author, \title, \location, \email, \phone
\author{Logan Daniel}
\title{mathematician, educator.}
\newcommand{\@location}{New York City, NY, USA}
\newcommand{\@email}{ldan@gmail.com}
\newcommand{\@phone}{123/456-7890}
\newcommand{\location}[1]{\renewcommand{\@location}{#1}}
\newcommand{\contact}[1]{\renewcommand{\@contact}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}

% title geometry
\newlength{\cvtitleheight}
\setlength{\cvtitleheight}{0.5in}

% use \makecvtitle to place the title within document
\newcommand{\makecvtitle}{
  \begin{minipage}[t][\cvtitleheight][c]{0.5\textwidth}
    \flushleft{{\Huge\sffamily\bfseries
      \@author
    }}
    \vspace{-5pt}\flushleft{{\itshape
      \@title
    }}
  \end{minipage}
  \begin{minipage}[t][\cvtitleheight][c]{0.5\textwidth}
    \flushright{\sffamily
      \@location\\
      \href{mailto:\@email}{\@email} | \@phone
    }
  \end{minipage}
}

%%%%%%

%%% section definition ------------------------------------------------------------------

\RequirePackage{titlesec}

% section geometry
\newlength{\sectionsep}
\setlength{\sectionsep}{8pt}

% format section
\titleformat{\section}
  {\Large\sffamily\bfseries\uppercase}
  {}
  {\sectionsep}
  {}[\titlerule]

%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% cv features -------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% cvitem ------------------------------------------------------------------------------
% generic line item with item, delim, info, and metadata.

% \cvitem{item}{info}{meta}{delim}
\newcommand{\cvitem}[4]{#1#4\ #2 \hfill #3}

%%%%%%

%%% custom cvitem -----------------------------------------------------------------------
% format a custom cvitem

% \newcvitem{name}{itemformat}{infoformat}{metaformat}{delim}
\newcommand{\newcvitem}[5]{%%
  \expandafter\newcommand\csname#1\endcsname[3]{%%
    \cvitem{{#2##1}}{{#3##2}}{{#4##3}}{#5}%%
  }
}

%%%%%%

%%% define cvitems ----------------------------------------------------------------------



%%%%%%

\makeatother
