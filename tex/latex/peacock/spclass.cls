\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spclass}[2012/12/04 v1.0]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mostly edited from the extarticle class %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{spcommon.def}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\newif\ifsp@stdmargins
\sp@stdmarginstrue
\newlength\sp@insidemarginwidth
\newlength\sp@outsidemarginwidth

\DeclareOption{kindlepaper}
   {\setlength\paperheight {4.8in}%
    \setlength\paperwidth  {3.6in}%
    \sp@stdmarginsfalse
    \sp@insidemarginwidth=0.5cm
    \sp@outsidemarginwidth=0.5cm
    \sloppy}
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b4paper}
   {\setlength\paperheight {353mm}%
    \setlength\paperwidth  {250mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{8pt}{\renewcommand\@ptsize{8}}
\DeclareOption{9pt}{\renewcommand\@ptsize{9}}
\DeclareOption{10pt}{\renewcommand\@ptsize{10}}
\DeclareOption{11pt}{\renewcommand\@ptsize{11}}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}
\DeclareOption{17pt}{\renewcommand\@ptsize{17}}
\DeclareOption{20pt}{\renewcommand\@ptsize{20}}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}

%%% SP options %%%

\newif\ifsp@fonts
\newif\ifsp@margin
\newif\ifsp@bib
\DeclareOption{fonts}{\sp@fontstrue}
\DeclareOption{nofonts}{\sp@fontsfalse}
\DeclareOption{margin}{\sp@margintrue}
\DeclareOption{nomargin}{\sp@marginfalse}
\DeclareOption{bib}{\sp@bibtrue}
\DeclareOption{nobib}{\sp@bibfalse}
%%%%%%%%%%%%%%

\ExecuteOptions{a4paper,10pt,oneside,final,fonts,margin,bib}
\ProcessOptions

\def\EC@family#1#2#3#4#5{%
  \DeclareFontShape{#1}{#2}{#3}{#4}%
  {<5><6><7><8><9><10><10.95><12><14.4>%
   <17.28><20.74><24.88><29.86><35.83><42.99><51.59>genb*#5}{}}
\EC@family{T1}{cmr}{m}{n}{ecrm}
\EC@family{T1}{cmr}{m}{sl}{ecsl}
\EC@family{T1}{cmr}{m}{it}{ecti}
\EC@family{T1}{cmr}{m}{sc}{eccc}
\EC@family{T1}{cmr}{bx}{n}{ecbx}
\EC@family{T1}{cmr}{b}{n}{ecrb}
\EC@family{T1}{cmr}{bx}{it}{ecbi}
\EC@family{T1}{cmr}{bx}{sl}{ecbl}
\EC@family{T1}{cmr}{bx}{sc}{ecxc}
\EC@family{T1}{cmr}{m}{ui}{ecui}
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {<5><6><7><8><9><10><12>gen*cmr%
      <10.95>cmr10%
      <14.4>cmr12%
      <17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmr17}{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {<5><6><7>cmsl8%
      <8><9>gen*cmsl%
      <10><10.95>cmsl10%
      <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {<5><6><7>cmti7%
      <8>cmti8%
      <9>cmti9%
      <10><10.95>cmti10%
      <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {<5><6><7><8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
   {<5><6><7><8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmu10%
      }{}
\DeclareFontShape{OT1}{cmr}{b}{n}
     {<5><6><7><8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmb10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{n}
   {<5><6><7><8><9>gen*cmbx%
      <10><10.95>cmbx10%
      <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
      {<5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
      {<5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbxti10%
      }{}
\input{size\@ptsize.clo}
\RequirePackage{exscale}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\setlength\parskip{4\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\hskip\sp@headeroffset%
        \thepage\hfil\slshape\leftmark\hfil%
        \hskip\sp@headeroffset}%
      \def\@oddhead{\hskip\sp@headeroffset%
        \hfil{\slshape\rightmark}\hfil\thepage%
        \hskip\sp@headeroffset}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
      \def\@oddhead{\hskip\sp@headeroffset%
        \hfil{\slshape\rightmark}\hfil\thepage%
        \hskip\sp@headeroffset}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\hskip\sp@headeroffset%
    \thepage\hfil\slshape\leftmark\hfil%
    \hskip\sp@headeroffset}%
  \def\@oddhead{\hskip\sp@headeroffset%
    \hfil{\slshape\rightmark}\hfil\thepage%
    \hskip\sp@headeroffset}%
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}

\newif\ifthanks
\def\@thanks{\relax}
\long\def\thanks#1{\long\def\@thanks{#1}\thankstrue}

\if@titlepage
\newcommand\maketitle{\begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \ifthanks\footnotetext{\@thanks}\fi
    \null\vfil
    \vskip 60\p@
    \begin{center}%
      {\LARGE \@title \par}%
      \vskip 3em%
      {\large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
          \@author
        \end{tabular}\par}%
      \vskip 1.5em%
      {\large \@date \par}%       % Set date in \large size.
    \end{center}\par
    \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else %% for \if@titlepage
\newcommand\maketitle{\par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \newpage
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \@maketitle
  \vskip0.04\paperheight%
  \thispagestyle{empty}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \ifthanks\footnotetext{\@thanks}\fi
  \null
  \begin{center}%
  \let \footnote \thanks
    {\Large \bfseries \@title \par}%
    \vskip 1.5em%
    {\lineskip .5em%
      \begin{tabular}[t]{c}%
        \large \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi



\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart         {\@Roman\c@part}
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi\par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname~\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\def\sp@secstyle{\normalfont\Large\bfseries}
\def\sp@subsecstyle{\normalfont\large\bfseries}
\def\sp@subsubsecstyle{\normalfont\normalsize\bfseries}
\def\sp@parstyle{\normalfont\normalsize\bfseries}
\def\sp@subparstyle{\normalfont\normalsize\bfseries}

\def\sectionstyle{\normalfont\large\scshape\bfseries}
\def\subsectionstyle{\normalfont\large\slshape}
\let\subsubsectionstyle\sp@subsubsecstyle
\let\paragraphstyle\sp@parstyle
\let\subparagraphstyle\sp@subparstyle


\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sectionstyle}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\subsectionstyle}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\subsubsectionstyle}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\paragraphstyle}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\subparagraphstyle}}
\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}                       
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}          
\newcommand\labelitemiv{\textperiodcentered}             
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
    \quotation\small%
    {\sc \abstractname.}\hspace{0.5em}}
  {\endquotation}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
    {%\newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\newpage
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\newcounter{figure}
\gdef\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\gdef\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{\MakeUppercase{\contentsname}}%
        {\MakeUppercase{\contentsname}}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase{\listfigurename}}%
      {\MakeUppercase{\listfigurename}}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{\MakeUppercase{\listtablename}}%
      {\MakeUppercase{\listtablename}}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname
         \@mkboth{\MakeUppercase{\refname}}%
         {\MakeUppercase{\refname}}}%
       \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
       \sloppy\clubpenalty4000\widowpenalty4000%
       \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
       \endlist}
     \newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
     \let\@openbib@code\@empty
\newenvironment{theindex}
               {\columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{empty}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\onecolumn}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\onecolumn




%%%% START OF SPCLASS CODE %%%%%

%\RequirePackage{graphics}  %% this make pdf pages correct size
%\RequirePackage{marginfix}
%\RequirePackage{morefloats}
\RequirePackage{bibentry}
\RequirePackage[numbers]{natbib}
%\RequirePackage{bophook}
\RequirePackage{ifpdf}
\RequirePackage{zref-abspos,zref-lastpage}
\RequirePackage[absolute]{textpos}
\RequirePackage{calc}
\RequirePackage{ifthen}

\ifpdf
    \AtBeginDocument{%
        \pdfpagewidth\paperwidth \pdfpageheight\paperheight%i
    }
\fi

\ifsp@fonts
  %%%% Change fonts %%%%%
  \RequirePackage{fourier}
  \RequirePackage{dsfont}
  \DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n}
  \DeclareMathAlphabet{\mathscr}{FMS}{futm}{m}{n}
  \DeclareSymbolFont{Udsrom}{U}{dsrom}{m}{n}
  \DeclareSymbolFontAlphabet{\math@bb}{Udsrom}
  %%%%%%%
\fi

%%%%%%%%%%%% Set page layout %%%%%%%%%%%%%%%%%%%%%%%%
\newlength\sp@headeroffset
\newlength\sp@gutterwidth

%\voffset=-72pt
%\hoffset=-72pt
\def\sp@calctextwidth{%
    \textwidth=\paperwidth%
    \advance\textwidth-1in
    \advance\textwidth-\hoffset
    \advance\textwidth-\oddsidemargin%
    \advance\textwidth-\marginparsep%
    \advance\textwidth-\marginparwidth%
    \advance\textwidth-\sp@gutterwidth
}
\def\sp@calcevensidemargin{%
    \evensidemargin=\sp@gutterwidth%
    \advance\evensidemargin\marginparwidth%
    \advance\evensidemargin\marginparsep
    \advance\evensidemargin-1in
    \advance\evensidemargin-\hoffset
}
 
\sp@headeroffset0pt
\ifsp@stdmargins
    \textwidth=0.618\paperwidth
    \marginparwidth=0.236\paperwidth
    \oddsidemargin=0.090\paperwidth
    \sp@gutterwidth=0.034\paperwidth
    \marginparsep=0.021\paperwidth

    \ifsp@margin
        \sp@headeroffset-0.63\marginparwidth
        \advance\sp@headeroffset-\marginparsep
    \else
        \marginparwidth=3\sp@gutterwidth
    \fi

    \advance\oddsidemargin-1in
    \advance\oddsidemargin-\hoffset
\else
    \oddsidemargin=\sp@insidemarginwidth
    \advance\oddsidemargin-1in
    \advance\oddsidemargin-\hoffset
    \marginparsep=0.1\sp@outsidemarginwidth
    \marginparwidth=0.8\sp@outsidemarginwidth
    \sp@gutterwidth=0.1\sp@outsidemarginwidth
\fi

\sp@calctextwidth
\sp@calcevensidemargin


\topmargin=0.05\paperheight
\advance\topmargin-1in
\advance\topmargin-\voffset
\headheight=0.025\paperheight
\headsep=0.04\paperheight
    \advance\headsep0.04\paperheight
\textheight=0.78\paperheight
    \advance\textheight-0.04\paperheight
\footskip=0.06\paperheight


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Set up environment for running bibliography %%%%
\ifsp@bib
    \AtBeginDocument{\nobibliography*\bibliographystyle{spalpha}}
\fi

%%%%%%%% Define margin environments %%%%%%%%%%
% Define default warnings if for 'nomargin' option
\provideenvironment{marginfigure}[1][]{%
    \PackageWarning{spclass}{Option 'nomargin' specified,
        'marginfigure' environment will be ignored.}
}{}
\let\citeonly\cite
\def\margincite#1{%
    \PackageWarning{spclass}{Option 'nomargin' specified,
        'margincite' macro will be ignored.}%
}
\def\sidenote#1{%
    \PackageWarning{spclass}{Option 'nomargin' specified,
        'sidenote' macro will be ignored.}%
}
\let\marginnote\sidenote
\let\footernote\footnote

\ifsp@margin
	\AtBeginDocument{\@ch@ckskipp@edb@x@s%
        \@djustm@rginp@siti@ns\pl@ceb@xes@np@ge}
	\AtBeginShipout{\pl@ceb@xes@np@ge}

	\let\sp@oldmarginpar\marginpar
	
	\def\m@rgintextformat#1{\footnotesize{}#1\vspace*{3ex}}
	\def\m@rginbox#1{\noindent\begin{minipage}[t]{\marginparwidth}
		\m@rgintextformat{#1}\end{minipage}}
	\def\m@rginboxbynum#1{\m@rginbox{\textsuperscript{%
	 	\zref@extractdefault{sidenote#1}{default}{}}%
	 	\zref@extractdefault{MPcon#1}{mpcontent}{}}}

	\newlength{\mphgt}
	\def\setmphgt#1{%
		\expandafter\ifx\csname MPhgt#1\endcsname\relax%
			\settototalheight{\mphgt}{\m@rginboxbynum{#1}}%
			\expandafter\xdef\csname MPhgt#1\endcsname{\the\mphgt}%
		\else%
			\setlength{\mphgt}{\csname MPhgt#1\endcsname}%
		\fi%
	}
  	\def\setadj#1#2{%
  		\expandafter\xdef\csname MPadj#1\endcsname{\the#2}%
	}
	\def\getadj#1{%
		\expandafter\ifx\csname MPadj#1\endcsname\relax%
			0.0pt%
		\else%
			\csname MPadj#1\endcsname%
		\fi%
	}
  
    \newcounter{mparctr}
	\def\themparctr{\arabic{mparctr}}
	\zref@newprop{mparctr}{\themparctr}
	\zref@addprop{LastPage}{mparctr}
	\zref@newprop{mpcontent}{}
	\zref@newprop{mpheight}{}
	\zref@newprop{mpadjust}{}
	\def\marginpar#1{%
		\stepcounter{mparctr}%
		\immediate\write\@auxout{\zref@newlabel{MPcon\themparctr}%
			{%
				\string\mpcontent{\unexpanded{#1}}%
			}}%
		\zsavepos{MPpos\themparctr}%
	}
	\def\placeXpos{%
		\ifodd\value{abspage}%
			\paperwidth-\marginparwidth-\sp@gutterwidth%
		\else%
			\if@twoside\sp@gutterwidth\else
			\paperwidth-\marginparwidth-\sp@gutterwidth\fi%
		\fi%
	}
	\def\placeYpos#1{%
		\paperheight-\zposy{MPpos#1}sp-0.5\baselineskip%
			-\getadj{#1}%
	}
	\def\@djustt@b@tt@m{%
		\setlength{\overlaptest}{\topmargin+\voffset+1in}%
		\addtolength{\overlaptest}{-\zposy{MPpos\theA}sp}%
		\addtolength{\overlaptest}{-\lastadjust}%
		\setmphgt{\theA}%
		\addtolength{\overlaptest}{\mphgt}%
		\ifthenelse{\lengthtest{0pt<\overlaptest}}%
		{%
			\setlength{\overlapadjust}{\lastadjust}%
			\addtolength{\overlapadjust}{\overlaptest+2ex}%
			\setadj{\theA}{\overlapadjust}%
			\setlength{\lastadjust}{\getadj{\theB}}%
			\def\sp@h@lt{0}%
		}{%
			\setadj{\theA}{\lastadjust}%
			\setlength{\lastadjust}{\getadj{\theB}}%
		}%
	}
    \def\skip@b@x#1{%
        \expandafter\ifx\csname mp@skipb@x@data#1\endcsname\relax%
            0%
        \else%
            \csname mp@skipb@x@data#1\endcsname%
        \fi%
    }
	\def\pl@ceb@x#1{%
		\stepcounter{abspage}
		\ifnum\zref@extractdefault{MPpos#1}{abspage}{0}=\value{abspage}
            \ifthenelse{\skip@b@x{#1}=1}{%
            }{%
                \begin{textblock*}{\marginparwidth}(\placeXpos,\placeYpos{#1})
                    \m@rginboxbynum{#1}%
                \end{textblock*}%
            }
		\fi\addtocounter{abspage}{-1}%
	}
	\newcounter{loopCtrA}
	\newcounter{loopCtrB}
	\newlength{\overlaptest}
	\newlength{\overlapadjust}
	\newlength{\lastadjust}
	\newcounter{@uterL@@p}
	\def\@djustm@rginp@siti@ns{%
		\def\sp@h@lt{0}
		\setcounter{@uterL@@p}{0}
		\whiledo{\sp@h@lt=0}{%
			\stepcounter{@uterL@@p}
			\def\sp@h@lt{1}%
			\setcounter{loopCtrA}{1}%
			\setcounter{loopCtrB}{2}%
			\def\theA{\arabic{loopCtrA}}\def\theB{\arabic{loopCtrB}}%
            \whiledo{\skip@b@x{\theA}=1}{\stepcounter{loopCtrA}}
            \setcounter{loopCtrB}{\value{loopCtrA}}
            \stepcounter{loopCtrB}
            \whiledo{\skip@b@x{\theB}=1}{\stepcounter{loopCtrB}}
			\setlength{\lastadjust}{\getadj{\theA}}%
				\whiledo{\value{loopCtrA}<%
						\zref@extractdefault{LastPage}{mparctr}{0}}{%
					\ifthenelse{\zref@extractdefault{MPpos\theA}{abspage}{0}=%
						\zref@extractdefault{MPpos\theB}{abspage}{0}}{%
					\setlength{\overlaptest}{\zposy{MPpos\theB}sp}%
					\addtolength{\overlaptest}{\getadj{\theB}}%
					\addtolength{\overlaptest}{-\zposy{MPpos\theA}sp}%
					\addtolength{\overlaptest}{-\lastadjust}%
					\setmphgt{\theA}%
					\addtolength{\overlaptest}{\mphgt}%
					\ifthenelse{\lengthtest{0pt<\overlaptest}}%
					{%
						\setlength{\overlapadjust}{\lastadjust}%
						\addtolength{\overlapadjust}{0.15\overlaptest+1pt}%
						\setadj{\theA}{\overlapadjust}%
						\setlength{\lastadjust}{\getadj{\theB}}%
						\addtolength{\lastadjust}{-0.85\overlaptest-1pt}%
						\def\sp@h@lt{0}%
					}{%
						\setadj{\theA}{\lastadjust}%
						\setlength{\lastadjust}{\getadj{\theB}}%
					}%
				}{%
					\@djustt@b@tt@m%
				}%
				\stepcounter{loopCtrA}
                \whiledo{\skip@b@x{\theA}=1}{\stepcounter{loopCtrA}}
				\stepcounter{loopCtrB}%
                \setcounter{loopCtrB}{\value{loopCtrA}}
                \stepcounter{loopCtrB}
                \whiledo{\skip@b@x{\theB}=1}{\stepcounter{loopCtrB}}
			}%
			%\setadj{\theA}{\lastadjust}%
			\@djustt@b@tt@m%
			\ifnum\value{@uterL@@p}>10000 \def\sph@lt{1}\fi%
		}%
	}
    \def\@ch@ckskipp@edb@x@s{
        \setcounter{loopCtrA}{0}
        \def\theA{\arabic{loopCtrA}}
        \whiledo{\value{loopCtrA}<\zref@extractdefault{LastPage}{mparctr}{0}}{%
            \stepcounter{loopCtrA}
            \expandafter\xdef%
                    \csname\zref@extractdefault{MPcitedet\theA}
                        {mpciteref}{NOTHING}abspage\endcsname{0}
        }
        \setcounter{loopCtrA}{0}
        \whiledo{\value{loopCtrA}<\zref@extractdefault{LastPage}{mparctr}{0}}{%
            \stepcounter{loopCtrA}%
            \ifthenelse{\zref@extractdefault{MPcitedet\theA}{mpiscite}{0}=1}%
                {\ifthenelse{\csname
                        \zref@extractdefault{MPcitedet\theA}
                            {mpciteref}{NOTHING}abspage\endcsname=
                        \zref@extractdefault{MPpos\theA}{abspage}{0}
                    }
                    {\expandafter\def\csname mp@skipb@x@data\theA\endcsname{1}}
                    {\expandafter\def\csname mp@skipb@x@data\theA\endcsname{0}}
                 \expandafter\xdef%
                    \csname\zref@extractdefault{MPcitedet\theA}
                        {mpciteref}{NOTHING}abspage\endcsname{%
                          \zref@extractdefault{MPpos\theA}{abspage}{0}}
                }
                {\expandafter\def\csname mp@skipb@x@data\theA\endcsname{0}}
        }%
    }
	\def\pl@ceb@xes@np@ge{%
		\setcounter{loopCtrA}{0}%
		\whiledo{\value{loopCtrA}<\zref@extractdefault{LastPage}{mparctr}{0}}{%
			\stepcounter{loopCtrA}%
			\pl@ceb@x{\arabic{loopCtrA}}%
		}%
	}

  \def\stdmarginpar#1{\sp@oldmarginpar{\m@rgintextformat{#1}}}
  \newsavebox{\sp@marginbox}

  \defenvironment{marginfigure}[1][0pt]
    {\begin{lrbox}{\sp@marginbox}
        \begin{minipage}{\marginparwidth}
          \hbox{}\footnotesize\vspace*{#1}}
    {\end{minipage}\end{lrbox}%
    	\stdmarginpar{\usebox{\sp@marginbox}}}
  
	  %\string\sidenote{\value{footnote}}%
  \def\sidenote#1{\refstepcounter{footnote}\textsuperscript{\thefootnote}%
    \stepcounter{mparctr}%
    \zref@label{sidenote\themparctr}%
	\addtocounter{mparctr}{-1}%
	\marginpar{#1}}
  \let\marginnote\sidenote
  \let\footernote\footnote
  \let\footnote\sidenote
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  %%%%%%%% Redefine citation style %%%%%%%%%%%%%
  %%%% Output citations to margin %%%%%
  \def\sp@declareCITE#1{%
      \marginpar{\normalfont\textsuperscript{\citep{#1}}\bibentry{#1}}}
  \def\margincite#1{\sp@declare{sp@declareCITE}{#1}}
  \zref@newprop{mpiscite}{}
  \zref@newprop{mpciteref}{}
  \renewcommand{\cite}[2][]{%
        \nocite{#2}%
        \citeonly[#1]{#2}\margincite{#2}%
        \immediate\write\@auxout{%
            \zref@newlabel{MPcitedet\themparctr}%
            {\string\mpiscite{1}\string\mpciteref{\unexpanded{#2}}}%
        }%
  }
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

  %%%%% Fix citation in right/left marks
  \let\sp@rightmark\rightmark
  \let\sp@leftmark\leftmark
  \def\rightmark{\let\margincite\sp@relax\sp@rightmark}
  \def\leftmark{\let\margincite\sp@relax\sp@leftmark}
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fi


\endinput
