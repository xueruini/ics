%% Copyright (C) 2009- by Ruini Xue <xueruini@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ics}
  [2009/07/14 1.0 
   Symposium on Innovations in Computer Science]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{}
\ProcessOptions
\LoadClass[a4paper,10pt,twocolumn]{article}

\RequirePackage{ifthen,calc}

% setup paper size
\RequirePackage[a4paper,textwidth=145mm,textheight=210mm,centering]{geometry}

\RequirePackage{indentfirst}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{times}
\RequirePackage[numbers,square,sort&compress]{natbib}
\RequirePackage{url}
\urlstyle{same}

% compact the itemize spaces
\let\itemize\compactitem
\let\enditemize\endcompactitem
\let\enumerate\compactenum
\let\endenumerate\endcompactenum
\let\description\compactdesc
\let\enddescription\endcompactdesc

% map font size
\newlength\ics@linespace
\newcommand{\ics@choosefont}[2]{%
   \setlength{\ics@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\ics@linespace}\selectfont}
\def\ics@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \ics@choosefont{##1}{#2}}}
\ics@define@fontsize{chuhao}{42bp}
\ics@define@fontsize{xiaochu}{36bp}
\ics@define@fontsize{yihao}{26bp}
\ics@define@fontsize{xiaoyi}{24bp}
\ics@define@fontsize{erhao}{22bp}
\ics@define@fontsize{xiaoer}{18bp}
\ics@define@fontsize{sanhao}{16bp}
\ics@define@fontsize{xiaosan}{15bp}
\ics@define@fontsize{sihao}{14bp}
\ics@define@fontsize{banxiaosi}{13bp}
\ics@define@fontsize{xiaosi}{12bp}
\ics@define@fontsize{dawu}{11bp}
\ics@define@fontsize{wuhao}{10.5bp}
\ics@define@fontsize{xiaowu}{9bp}
\ics@define@fontsize{liuhao}{7.5bp}
\ics@define@fontsize{xiaoliu}{6.5bp}
\ics@define@fontsize{qihao}{5.5bp}
\ics@define@fontsize{bahao}{5bp}

% force the paper size
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
      \@percentchar\@percentchar BeginPaperSize: a4
      ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}

\captionsetup{font=small}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}

% setup title/auth info
\def\and{\hskip.5em}
\newcommand{\address}[1]{\long\gdef\@address{#1}}
\newcommand{\email}[1]{\long\gdef\@email{#1}}

% setup abstract
% NOTE: we have to collect the abstract first, and then typeset it in maketitle,
% otherwise, it is too difficult to fullfill onecolumn. 
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\@@abstract}[1]{\long\gdef\@abstract{#1}}
\renewenvironment{abstract}{\collect@body\@@abstract}{}

\newcommand{\keywords}[1]{\long\gdef\@keywords{#1}}

\def\@maketitle{%
  \newpage
  \null
  \begin{center}%
    \let \footnote \thanks
    {\sanhao[1.5]\bfseries\sffamily \@title \par}%
    \vskip1em
    {\wuhao[1.3]
      {\sffamily \@author \par}
      {\let\and\par\@address\par}
      {\@email\par}}
  \end{center}%
  \par\vskip .5em
  %\xiaowu[1.2]%
  {\noindent\bfseries \abstractname: }\@abstract\par
  \vskip.6\baselineskip
  {\noindent\bfseries Keywords: } \@keywords\par
  \vskip 2em}

% setup sections
\setcounter{secnumdepth}{5}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {1ex \@plus.2ex}%
                                   {\normalfont\xiaosi\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {.5ex \@plus .2ex}%
                                     {\normalfont\wuhao\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2ex\@plus -1ex \@minus -.2ex}%
                                     {.3ex \@plus .2ex}%
                                     {\normalfont\wuhao\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-1ex \@plus -1ex \@minus -.2ex}%
                                    {.1ex}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {-1ex \@plus -1ex \@minus -.2ex}%
                                       {.1ex}%
                                      {\normalfont\normalsize\bfseries}}
\renewcommand\theparagraph    {\@arabic\c@paragraph)}
\renewcommand\thesubparagraph {(\@alph\c@subparagraph)}

% setup bib
\setlength{\bibsep}{0em}
\renewcommand{\bibfont}{\small}