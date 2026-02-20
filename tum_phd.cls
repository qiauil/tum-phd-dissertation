%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Unofficial LaTeX template for dissertations at Technische Universität München (TUM)
%% Updates can be found at https://github.com/qiauil/tum-phd-dissertation
%%
%% Based on the University of Malta template by Prof. JP Ebejer 
%% (https://github.com/jp-um/university_of_malta_LaTeX_dissertation_template)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tum_phd}[2026.02.20 v0.1 unofficial tum phd dissertation class]

% Require LuaLaTeX
\RequirePackage{iftex}
\ifLuaTeX\else
\ClassError{tum_phd}{This class requires LuaLaTeX}{Run lualatex instead of pdflatex or xelatex.}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[11pt,a4paper,final]{memoir}

%% **************** Packages (Start) *********************

% ===== Fonts (LuaLaTeX) =====
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX, Scale=MatchLowercase}

% Palatino-like main font
\setmainfont{TeX Gyre Pagella}
% Lato sans (works via fontspec if installed by TeX Live)
\setsansfont{Lato}
% Monospace
%\setmonofont{Consolas}

%% **************** For title page *********************
\RequirePackage{geometry}
\newfontfamily\arial{Arial}[Scale=1.0]
\newenvironment{tumtitlepage}{\arial\linespread{1.0}\thispagestyle{empty}\newgeometry{left=2.5cm, right=2.5cm, top=2.5cm, bottom=1cm}}{\newpage\restoregeometry}

% ===== Languages =====
\RequirePackage[english]{babel} % OK with LuaLaTeX;
\RequirePackage[useregional]{datetime2}  % datetime2 is the modern replacement

% ===== Graphics, color, hyperlinks, bib =====
\RequirePackage{graphicx}   % no driver option
\RequirePackage{xcolor}
\RequirePackage{eso-pic}


\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=MidnightBlue,
	citecolor=DarkGreen,
	urlcolor=RoyalBlue
}

% Biblatex (APA) with biber backend
\RequirePackage[style=apa,backend=biber]{biblatex}

% ===== Maths, floats, tables, code, algos =====
\RequirePackage{amsmath,amssymb}
\RequirePackage{floatpag}
\RequirePackage{longtable}
\RequirePackage{pdflscape}
\RequirePackage{amsthm}     % memoir has its own theorem machinery; this is still OK
\RequirePackage{listings}
\RequirePackage[ruled]{algorithm2e}
\RequirePackage[printonlyused,withpage]{acronym}

% ===== Memoir-native caption setup (replace the 'caption' package) =====
% Your original had: \usepackage[width=.95\textwidth]{caption}
% Use memoir controls instead:
\captionnamefont{\small\bfseries}
\captiontitlefont{\small}
\captiondelim{: }
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{6pt}
\captionwidth{0.95\textwidth}
\captionstyle{\centering} % optional: center multi-line captions

%% ****************** Packages (End) *********************


%% ************ UM Definitions (Start) *****************

\definecolor{OxfordBlue}{rgb}{0,0.106,0.329}   % Color
\definecolor{UMRed}{rgb}{0.73,0.09,0.19}   % UM Logo Color
\definecolor{TUMBlue}{rgb}{0.027, 0.129, 0.251}   % TUM Logo Color
\colorlet{DissertationColor}{TUMBlue}   
%% ************* UM Definitions (End) ******************




%% ************ Document Options (Start) *****************

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
	backgroundcolor=\color{backcolour},   
	commentstyle=\color{codegreen},
	keywordstyle=\color{magenta},
	numberstyle=\tiny\color{codegray},
	stringstyle=\color{codepurple},
	basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,         
	breaklines=true,                 
	captionpos=b,                    
	keepspaces=true,                 
	numbers=left,                    
	numbersep=5pt,                  
	showspaces=false,                
	showstringspaces=false,
	showtabs=false,                  
	tabsize=2
}

\lstset{style=mystyle}

\OnehalfSpacing                                  % One and a half line spacing

\setlength{\headsep}{1.5cm}                      % Add space between the header and text

\nouppercaseheads								 % Don't convert titles to Uppercase
\makepagestyle{umpage}

												 % This travesty is due to a bug in memoir, see https://tex.stackexchange.com/questions/468922/oneside-in-memoir-causing-header-trouble
\makeevenhead{umpage}{\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\makeoddhead{umpage}{\color{gray}\sffamily\small\leftmark}{}{\color{gray}\sffamily\small\rightmark}
\makeevenfoot{umpage}{}{\thepage}{}  			 % UM pagestyle, put page at bottom
\makeoddfoot{umpage}{}{\thepage}{}
\makeheadfootruleprefix{umpage}{\color{gray}}{}
\makeheadrule{umpage}{\textwidth}{\normalrulethickness}
\makepsmarks{umpage}{%
	\createmark{chapter}{left}{shownumber}{\@chapapp\ }{. \ }
	\createmark{section}{right}{shownumber}{}{. \ }
}

\copypagestyle{umpageback}{umpage}
\makeevenhead{umpageback}{\color{gray}\sffamily\small\leftmark}{}{}
\makeoddhead{umpageback}{}{}{\color{gray}\sffamily\small\rightmark}


\setlrmarginsandblock{3.7cm}{2.5cm}{*}           % Set the page margins (for one and two sided docs) 
\checkandfixthelayout                            % Put layout into effect

\graphicspath{{./images/}}                       % Where to look for images (paths) ...
\DeclareGraphicsExtensions{.pdf,.jpeg,.png,.jpg} % Graphics extensions to load

%% other possible values: bianchi, bringhurst, brotherton, chappell, crosshead, culver, dash, demo2, demo3, dowding, ell (default), ger, komalike, lyhne, madsen, ntglike, pedersen, southall, tandh, thatcher, veelo, verville, wilsondob
\chapterstyle{ell} % how to draw the different chapter headings


\renewcommand*{\chapnumfont}{\sffamily\HUGE\bfseries\color{DissertationColor}}  % Chapter titles should be normal
\renewcommand*{\chaptitlefont}{\sffamily\HUGE\bfseries\color{DissertationColor}}
\setsecheadstyle{\sffamily\LARGE\bfseries\color{DissertationColor}}% Set \section style
\setsubsecheadstyle{\sffamily\Large\color{DissertationColor}}% Set \subsection style
\setsubsubsecheadstyle{\sffamily\large\color{DissertationColor}}% Set \subsection style
\setsecnumformat{\csname the#1\endcsname\enskip{\color{gray}\textbar}\enskip}

\newsubfloat{figure} % declares a new subfloat element which allows to use \subbottom commands

\renewcommand{\labelitemi}{\color{DissertationColor}\scriptsize$\blacksquare$}

% Controls space between one reference and the next
\setlength{\bibitemsep}{\onelineskip}

\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}} % to set array stretch within tables

\hypersetup{%
    colorlinks=false,
%    linkcolor=DissertationColor,
%    citecolor=DissertationColor,
%    urlcolor=DissertationColor,
%    filecolor=magenta, 
    pdfborder={0 0 0},    
}

\feetbelowfloat % we want the footnotes below floats, not wierdly above

\setsecnumdepth{subsubsection}  % three level depth - chapter, section, subsection, subsubsection
\settocdepth{subsection}

\renewcommand*{\cftappendixname}{Appendix\space}
\newcommand{\removelinebreaks}[1]{%
	\begingroup\def\\{ }#1\endgroup}


\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{lemma}[theorem]{Lemma}

%% ************* Document Options (End) ******************






%% *************** Environments (Start) ******************




%% *** Title Page (Start) ***
% background image
% taken from http://tug.org/pracjourn/2008-1/mori/mori.pdf
\newcommand\AlCentroPagina[1]{%
\AddToShipoutPicture*{\AtPageCenter{%
\makebox(0,-50){\includegraphics[width=0.5\paperwidth]{#1}}}}}
\RequirePackage{etoolbox}


% The front page

\addto{\captionsenglish}{\renewcommand{\abstractname}{\Large\bfseries\sffamily\textcolor{DissertationColor}{Abstract}}}


\newenvironment{acknowledgements}
{\renewcommand{\abstractname}{\Large\bfseries\sffamily\textcolor{DissertationColor}{Acknowledgements}}\abstract}
{\endabstract\if@openright\cleardoublepage\else\clearpage\fi}
       
\addto{\captionsenglish}{\renewcommand{\abstractname}{\Large\bfseries\sffamily\textcolor{DissertationColor}{Abstract}}}


\newenvironment{dedication}
  {\clearpage           % we want a new page
   \thispagestyle{empty}% no header and footer
   \vspace*{\stretch{1}}% some space at the top 
   \itshape             % the text is in italics
   \raggedleft          % flush to the right margin
   \textcolor{DissertationColor}
  }
  {\par % end the paragraph
   \vspace{\stretch{3}} % space at bottom is three times that at the top
   \if@openright\cleardoublepage\else\clearpage\fi
  }       
       


% COPYRIGHT
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{copyrightenv}
{\clearpage
	~\vfill
	\thispagestyle{empty}
	
	\begin{figure}[h]
		\includegraphics[width=2.5in]{umlogo_full_red}
	\end{figure}
	
	\noindent Copyright \textcopyright\the\year\ University of Malta\\ % Copyright notice
	
	\noindent \textsc{www.um.edu.mt}\\ % URL
	
	\noindent \textit{First edition, \today} % Printing/edition date
	
	%% \noindent Licensed under the Creative Commons Attribution-NonCommercial 3.0 Unported License (the ``License''). You may not use this file except in compliance with the License. You may obtain a copy of the License at \url{http://creativecommons.org/licenses/by-nc/3.0}. Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \textsc{``as is'' basis, without warranties or conditions of any kind}, either express or implied. See the License for the specific language governing permissions and limitations under the License.\\ % License information
	\if@openright\cleardoublepage\else\clearpage\fi}


% Conditions for Equations Environment
%
\newenvironment{conditionsenv*}
{\par\vspace{\abovedisplayskip}\noindent
	\tabularx{\columnwidth}{>{$}l<{$} @{${}={}$} >{\raggedright\arraybackslash}X}}
{\endtabularx\par\vspace{\belowdisplayskip}}

%% **************** Environments (End) *******************

\endinput