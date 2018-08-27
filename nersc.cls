\ProvidesClass{nersc}[2018/8/22 v1.0 NERSC LaTeX template]

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{beamer}
}
\ProcessOptions\relax
\LoadClass[10pt,compress]{beamer}
\usefonttheme[onlymath]{serif}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Load the myriad packages
%
\usepackage{bbding}
\usepackage{xcolor}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{import}
\usepackage{relsize}
\usepackage{textcomp}
\usepackage{listings}
\usepackage[autostyle]{csquotes}
\usepackage[parfill]{parskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Colors
%
\definecolor{mygreen}{rgb}{0,0.75,0}
\definecolor{myblue}{rgb}{0.1,0.1,0.9}
\definecolor{mypink}{rgb}{1.0,0.08,0.58}
\definecolor{mygray}{rgb}{0.1,0.1,0.1}
\definecolor{maroon}{rgb}{0.5,0,0}
\definecolor{darkblue}{rgb}{0.1,0.1,0.44}
\definecolor{amber}{rgb}{1.0, 0.49, 0.0}
\definecolor{green}{rgb}{0,0.9,0}
\definecolor{grey}{rgb}{0.2,0.2,0.2}
%\definecolor{nerscblue}{rgb}{0,0.0,0.55}
\definecolor{nerscblue}{HTML}{001050}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Styles
%
\lstdefinestyle{customc}{
    belowcaptionskip=1\baselineskip,
    breaklines=true,
    frame=L,
    xleftmargin=\parindent,
    language=C++,
    showstringspaces=false,
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\bfseries\color{mygreen},
    commentstyle=\itshape\color{red},
    identifierstyle=\color{myblue},
    stringstyle=\color{mypink},
    keepspaces=true,
    tabsize=2,
    numberstyle=\tiny\color{mygray},
    numbers=none,
    columns=flexible
}

\lstdefinestyle{custompy}{
    belowcaptionskip=1\baselineskip,
    breaklines=true,
    frame=L,
    xleftmargin=\parindent,
    language=Python,
    showstringspaces=false,
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\bfseries\color{mygreen},
    commentstyle=\itshape\color{red},
    identifierstyle=\color{myblue},
    stringstyle=\color{mypink},
    keepspaces=true,
    tabsize=2,
    numberstyle=\tiny\color{mygray},
    numbers=none,
    columns=flexible
}

\lstdefinestyle{customshell}{
    belowcaptionskip=1\baselineskip,
    breaklines=true,
    frame=L,
    xleftmargin=\parindent,
    language=Bash,
    showstringspaces=false,
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\color{black},
    commentstyle=\color{red},
    identifierstyle=\color{black},
    stringstyle=\color{mypink},
    keepspaces=true,
    tabsize=2,
    numberstyle=\tiny\color{mygray},
    numbers=none,
    columns=flexible
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Commands
%
\newcommand{\inlinecode}[1]{\colorbox{white}{\lstinline[basicstyle=\ttfamily\color{blue}]|#1|}}
\newcommand{\inlinecodestr}[1]{\colorbox{white}{\lstinline[basicstyle=\ttfamily\color{mypink}]|#1|}}
\newcommand{\lstinlinec}{\lstinline[columns=fixed,style=customc]}
\newcommand{\lstinlinepy}{\lstinline[columns=fixed,style=custompy]}
\newcommand{\eg}{{\it e.g.,~}}
\newcommand{\ie}{{\it i.e.,~}}
\newcommand{\tilda}[0]{{\texttt{\raise.17ex\hbox{$\scriptstyle\sim$}}}}
\newcommand{\e}[1]{\ensuremath{\times 10^{#1}}}
\newcommand{\scinote}[2]{\ensuremath{#1 \times 10^{#2}}}
\newcommand{\twodims}[2]{\ensuremath{#1 \times #2}}
\newcommand{\threedims}[3]{\ensuremath{#1 \times #2 \times #3}}
\newcommand{\rsubs}[0]{\ensuremath{\text{r}_{\text{s}}}}
\newcommand{\rsubsparam}[1]{$\text{r}_{s} = #1$}
\newcommand{\rfrac}[2]{\ensuremath{{}^{#1}\!/_{#2}}}
\newcommand{\email}[1]{\raisebox{-.5ex}{\Envelope}~\href{mailto:#1}{#1}}
\newcommand\CPP{C\nolinebreak[4]\hspace{0.025em}\raisebox{.4ex}{\relsize{-3}{\textbf{++}}}~}
\newcommand\CPPELEVEN{C\nolinebreak[4]\hspace{0.025em}\raisebox{.4ex}{\relsize{-3}{\textbf{++}}}11~}
\newcommand{\backupbegin}{\newcounter{finalframe} \setcounter{finalframe}{\value{framenumber}}}
\newcommand{\backupend}{\setcounter{framenumber}{\value{finalframe}}}

\makeatletter
    \newcommand\smallerfont{\@setfontsize\smallerfont{9pt}{10}}
    \newcommand\smallestfont{\@setfontsize\smallestfont{8pt}{9}}
    \newcommand\smalltikzfont{\@setfontsize\smalltikzfont{8pt}{8}}
    \newcommand*{\compresson}{\addtocontents{nav}{\protect\headcommand{\protect\beamer@compresstrue}}}
    \newcommand*{\compressoff}{\addtocontents{nav}{\protect\headcommand{\protect\beamer@compressfalse}}}
\makeatother

\providecommand{\meetingname}{}
\newcommand*{\meeting}[1]{\def\@meetingname{#1}}

% increase the vertical spacing of tables
\renewcommand{\arraystretch}{1.15}

\hypersetup{
  colorlinks   = true, %Colours links instead of ugly boxes
  urlcolor     = blue, %Colour for external hyperlinks
  linkcolor    = white, %Colour of internal links
  citecolor    = blue %Colour of citations
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input/Graphic paths
%
\DeclareGraphicsExtensions{.jpg}
\makeatletter
    \def\input@path{{./sections/}{./data/}}
\makeatother
\graphicspath{ {./images/} }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Beamer setup
%

%------------------------------------------------------------------------------%
%
\defbeamertemplate*{title page}{nersc}[1][]
{

    \begin{columns}[T]
    \setbeamercolor{coloredboxstuff}{fg=white,bg=nerscblue}
    \begin{beamercolorbox}[wd=0.5\paperwidth,dp=0.5\paperwidth]{coloredboxstuff}
    \begin{column}[T]{0.5\paperwidth}
    \begin{minipage}[t][0.5\textwidth][t]{\textwidth}
    \begin{center}
        \vspace{0.225\paperwidth}
        \usebeamerfont{title}\inserttitle \\
        \usebeamerfont{subtitle}\insertsubtitle
    \end{center}
    \end{minipage}
    \end{column}
    \end{beamercolorbox}
    %
    \setbeamercolor{coloredboxstuff}{fg=white,bg=white}
    \begin{beamercolorbox}[wd=0.5\paperwidth,dp=0.5\paperwidth]{coloredboxstuff}
    \begin{column}[T]{0.5\paperwidth}
    % \begin{minipage}[t][0.5\textwidth][t]{\textwidth}
    \begin{center}
        \includegraphics[width=0.5\paperwidth, height=0.5\paperwidth]{nersc_science}
    \end{center}
    % \end{minipage}
    \end{column}
    \end{beamercolorbox}
    \end{columns}
    %

    \bigskip
    \vfill

    %
    \begin{columns}[c]
        \begin{column}[c]{0.5\paperwidth}
            \begin{center}
                \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par
                \vspace{0.1cm}
                \includegraphics[width=20ex, height=5ex]{doe_office_of_science_logo}\hspace{0.1\textwidth}
                \includegraphics[width=5ex, height=5ex]{lbl_logo}\par
            \end{center}
        \end{column}
        \begin{column}[c]{0.5\paperwidth}
            \usebeamerfont{author}\insertauthor\par
            \usebeamerfont{institute}\insertinstitute\par
            \usebeamerfont{date}\insertdate\par
        \end{column}
    \end{columns}
}

%------------------------------------------------------------------------------%
%
% mode
%
\mode<presentation>
{
    \usepackage[english]{babel}
    %\usetheme{Frankfurt}

    \usecolortheme[RGB={0,40,80},Alpha=50]{structure}

    % This will typeset only the frames (or slides) that have the given label ("current" in this case).
    % \includeonlyframes{current}
}

%------------------------------------------------------------------------------%
%
% title page graphic
%
\titlegraphic{\includegraphics[height=0.125\textheight]{nersc_logo_descript}}

%------------------------------------------------------------------------------%
%
% outer theme
%
\useoutertheme{infolines}
% \useoutertheme{miniframes}
% \useoutertheme{shadow}
% \useoutertheme{sidebar}
% \useoutertheme{smoothbars}
% \useoutertheme{smoothtree}
% \useoutertheme{split}
% \useoutertheme{tree}

%------------------------------------------------------------------------------%
%
% inner theme (some will be specific to outer)
%
% \useinnertheme{boadilla}
% \useinnertheme{rectangles}
\useinnertheme{circles}

%------------------------------------------------------------------------------%
%
% template config
%
\setbeamertemplate{navigation symbols}{}
% \setbeamertemplate{navigation symbols items}{}
%
% \setbeamertemplate{itemize items}[circles]
% \setbeamertemplate{enumerate items}[default]
% \setbeamertemplate{itemize item}{\scriptsize\raise1.25pt\hbox{\donotcoloroutermaths$\blacktriangleright$}}
% \setbeamertemplate{itemize subitem}{\tiny\raise1.5pt\hbox{\donotcoloroutermaths$\blacktriangleright$}}
% \setbeamertemplate{itemize subsubitem}{\tiny\raise1.5pt\hbox{\donotcoloroutermaths$\blacktriangleright$}}
\setbeamertemplate{itemize subitem}{\large\textopenbullet}
\setbeamertemplate{itemize subsubitem}{\scriptsize\raise1.5pt\hbox{\donotcoloroutermaths$\triangleright$}}
\setbeamertemplate{bibliography entry title}{}
\setbeamertemplate{bibliography entry location}{}
\setbeamertemplate{bibliography entry note}{}
\setbeamertemplate{caption}[numbered]
\setbeamertemplate{footline}
{%
    \leavevmode%
    \raisebox{-3pt}{\hbox{
        \includegraphics[width=0.125\paperwidth, height=6.5ex]{doe_office_of_science_logo}
        \hfill
    }}
    \hbox{
        \begin{beamercolorbox}[wd=0.8\paperwidth,ht=4ex,dp=2.25ex,leftskip=.3cm,rightskip=.3cm]{author in head/foot}%
        \usebeamerfont{author in head/foot}
        \@meetingname\hfill\insertshortauthor~(\insertshortinstitute)\hfill\insertdate\hfill\insertframenumber~/~\inserttotalframenumber
        \end{beamercolorbox}
    }%
    \hfill
    \raisebox{-4.75pt}{\hbox{
        \includegraphics[width=6.5ex, height=6.5ex]{lbl_logo}
    }}%
    \vskip0pt%
}

%------------------------------------------------------------------------------%
%
% beamer font/colors
%
\setbeamercovered{transparent}
\setbeamerfont{headline}{size=\footnotesize}
\setbeamercolor{frametitle}{fg=white,bg=nerscblue}
\setbeamercolor{section in head/foot}{fg=gray,bg=nerscblue}
\setbeamercolor{subsection in head/foot}{bg=gray,fg=nerscblue}
\setbeamercolor{headline}{bg=nerscblue}
\setbeamercolor{structure in head/foot}{fg=nerscblue}
\setbeamercolor{text in head/foot}{fg=white, bg=nerscblue}
\setbeamercolor{alerted text in head/foot}{fg=white, bg=nerscblue}
\setbeamercolor{author in head/foot}{bg=nerscblue,fg=white}
\setbeamercolor{date in head/foot}{fg=nerscblue,bg=white}
% \setbeamercolor{palette primary}{fg=nerscblue,bg=gray}
% \setbeamercolor{palette secondary}{fg=nerscblue,bg=gray}
% \setbeamercolor{palette tertiary}{fg=nerscblue,bg=gray}
% \setbeamercolor{palette quaternary}{fg=nerscblue,bg=gray}
\setbeamercolor{background canvas}{bg=white}
% \setbeamercolor{alerted text}{fg=nerscblue}


%------------------------------------------------------------------------------%
%
% beamer template
%
% \setbeamertemplate{nersc}
% {
%     \begin{beamercolorbox}[ht=2.0ex,dp=5.0ex]{section in head/foot}
%         \insertnavigation{\paperwidth}
%     \end{beamercolorbox}%
% }
% \makeatother


%------------------------------------------------------------------------------%
%
% default title page values
%

\institute[NERSC-LBL]{\vspace{1ex}
\scriptsize National Energy Research Scientific Computing Center\\
Lawrence Berkeley National Laboratory \\[1ex]}
\date[\today]{\today}

