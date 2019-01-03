\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flypcv}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

\makeatletter

%%% geometry, footer -------------------------------------------------------------------

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
\fancyfoot[R]{\sffamily\scriptsize \thepage\ of\ \pageref{LastPage}} % page number
\fancyfoot[L]{\sffamily\itshape\scriptsize curriculum vitae} % "c.v." text

%%%%%%

%%% cvtitle -----------------------------------------------------------------------------

% supported header parameters
%   \author, \title, \location, \contact
\author{Logan Daniel}
\title{mathematician, educator.}
\newcommand{\@location}{New York City, NY, USA}
\newcommand{\@contact}{ldan@gmail.com | 123/456-7890}
\newcommand{\location}[1]{\renewcommand{\@location}{#1}}
\newcommand{\contact}[1]{\renewcommand{\@contact}{#1}}

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
      \@contact
    }
  \end{minipage}
}

%%%%%%


\makeatother
