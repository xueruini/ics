\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ics}
[2009/07/09 1.0 Symposium on Innovations in Computer Science]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{}
\ProcessOptions
\LoadClass[a4paper,10pt,twocolumn]{article}

\RequirePackage{ifthen,calc}

% setup paper size
\RequirePackage[a4paper,textwidth=185mm,textheight=260mm,centering]{geometry}

\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{indentfirst}
\RequirePackage{times}
\RequirePackage[numbers,super,square,sort&compress]{natbib}
\RequirePackage{url}
\urlstyle{same}
\RequirePackage[neverdecrease]{paralist}

% compact the itemize spaces
\let\itemize\compactitem
\let\enditemize\endcompactitem
\let\enumerate\compactenum
\let\endenumerate\endcompactenum
\let\description\compactdesc
\let\enddescription\endcompactdesc

% map font size
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
   \setlength{\thu@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}

% force the paper size
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
      \@percentchar\@percentchar BeginPaperSize: a4
      ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}

\captionsetup{font=small}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}

% setup title/auth info
\def\and{\hskip1em}
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
  \vskip 1em%
  \begin{center}%
  \let \footnote \thanks
    {\sanhao[1.5]\bfseries\sffamily \@title \par}%
    {\xiaosi[1.5] \@author \par}
    {\xiaowu[1.5] \@address \par}
    {\xiaowu[1.5] Email: \@email \par}
  \end{center}%
  \par
  \vskip 1em
  \xiaowu[1.2]%
  {\noindent\bfseries \abstractname: }\@abstract\par
  {\noindent\bfseries Keywords: } \@keywords\par
  \vskip 2em}

% setup sections
\setcounter{secnumdepth}{5}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {1.5ex \@plus.2ex}%
                                   {\normalfont\sihao\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-2.25ex\@plus -1ex \@minus -.2ex}%
                                     {1ex \@plus .2ex}%
                                     {\normalfont\wuhao\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-2ex\@plus -1ex \@minus -.2ex}%
                                     {1ex \@plus .2ex}%
                                     {\normalfont\wuhao\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-1ex \@plus -1ex \@minus -.2ex}%
                                    {1ex}%
                                    {\normalfont\normalsize}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {-1ex \@plus -1ex \@minus -.2ex}%
                                       {.5ex}%
                                      {\normalfont\normalsize}}
\renewcommand\theparagraph    {\@arabic\c@paragraph)}
\renewcommand\thesubparagraph {(\@alph\c@subparagraph)}

\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}

\def\@biblabel#1{{\bfseries #1.}}
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \xiaowu[1.3]
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\renewcommand{\makelabel}[1]{##1\hfill}
            \settowidth\labelwidth{\@biblabel{#1}}%
            \addtolength{\itemsep}{-1em}
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
