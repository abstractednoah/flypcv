\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flypcv}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt]{article}

\makeatletter

%%% reasonable margins %%%
\RequirePackage{fullpage}
%%%%%%

%%% cvtitle %%%

% supported header parameters
%   \author, \title, \location, \contact
\author{Na M. E.}
\title{Titl, E}
\newcommand{\@location}{Locati, ON}
\newcommand{\@contact}{name@dom.ain}
\newcommand{\location}[1]{\renewcommand{\@location}{#1}}
\newcommand{\contact}[1]{\renewcommand{\@contact}{#1}}

\newcommand{\makecvtitle}{
  \begin{minipage}[t][0.1\textheight][c]{0.5\textwidth}
    \flushleft{{\sffamily\Huge \@author}\\\@title}
  \end{minipage}
  \begin{minipage}[t][0.1\textheight][c]{0.5\textwidth}
    \flushright{\@location\\\@contact}
  \end{minipage}
}

%%%%%%


\makeatother
