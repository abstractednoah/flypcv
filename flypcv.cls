\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flypcv}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

\makeatletter

%%% geometry ----------------------------------------------------------------------------
\RequirePackage{fullpage}
\setlength\parindent{0pt}
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

% use \makecvtitle to place the title within document
\newcommand{\makecvtitle}{
  \begin{minipage}[t][0.1\textheight][c]{0.5\textwidth}
    \flushleft{{\Huge\sffamily\bfseries
      \@author
    }}
    \vspace{-5pt}\flushleft{{\itshape
      \@title
    }}
  \end{minipage}
  \begin{minipage}[t][0.1\textheight][c]{0.5\textwidth}
    \flushright{\sffamily
      \@location\\
      \@contact
    }
  \end{minipage}
}

%%%%%%


\makeatother
