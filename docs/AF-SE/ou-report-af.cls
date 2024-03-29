\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ou-report-af}[2014/04/02 v0.1 Open Universiteit report class]

\newif\if@dutch
\newif\if@english
\DeclareOption{dutch}{\@dutchtrue\@englishfalse}
\DeclareOption{english}{\@dutchfalse\@englishtrue}
\newif\if@nativefonts
\DeclareOption{nativefonts}{\@nativefontstrue}
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{english}
\ProcessOptions\relax

\LoadClass[12pt]{article}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
%% English is the default language, but this can be changed to Dutch by
%% specifying the 'dutch' option to the document class.
\if@dutch
    \RequirePackage[dutch]{babel}
\else
    %% Even for English reports, some sections might be in Dutch, for example on
    %% the title page.
    \RequirePackage[dutch,english]{babel}
\fi
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{metalogo}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}
\RequirePackage{listings}
\RequirePackage[titletoc]{appendix}
\RequirePackage[T1]{fontenc}    % Necessary for pipe symbol  | |  |
\RequirePackage{subfigure}
\RequirePackage{graphics}
\RequirePackage{geometry}
\usetikzlibrary{decorations,decorations.pathmorphing,arrows,arrows.meta,automata,trees,backgrounds,petri,shapes,shapes.geometric,quotes,fit,positioning,calc}
\ifxetex
    %\RequirePackage[xetex,plainpages=false]{hyperref}
    %\RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        %\RequirePackage[pdftex,plainpages=false]{hyperref}
    \else
        %\RequirePackage[hypertex,plainpages=false]{hyperref}
    \fi
\fi
\RequirePackage[pagebackref=true,plainpages=false]{hyperref}


\ifxetex
    %% If the document is compiled with XeLaTeX, we load the OU house
    %% style fonts: Bookman Old Style (serif) for titles and Tahoma (sans-serif)
    %% for text. Even if the nativefonts option was specified, we need these
    %% fonts for the cover.
    \newfontfamily\ourmfamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{BookmanOldStyle}
    \newfontfamily\ousffamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{Tahoma}
\else
    %% If the document is not compiled with XeLaTeX, we need to use the native
    %% fonts.
    \@nativefontstrue
    \newcommand*\ourmfamily{\rmfamily}
    \newcommand*\ousffamily{\sffamily}
\fi



\if@nativefonts
    %% The native font is Utopia Regular with Fourier math. We use Latin Modern
    %% as a fallback, since Utopia lacks support for sans-serif and monospace.
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{lmodern}
    \RequirePackage{fourier}
    %% The style for titles is small caps.
    \def\titlefont{\rmfamily}
    \def\titleshape{\scshape}
    \def\titlestyle{\titlefont\titleshape\bfseries}
    \if@print
        \def\headerstyle{\titlefont\titleshape\bfseries}
    \else
        \def\headerstyle{\titlefont\titleshape}
    \fi
\else
    %% Apart from Bookman Old Style and Tahoma, we use Courier New for monospace
    %% and Cambria for math.
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{BookmanOldStyle}
    \setsansfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{Tahoma}
    \setmonofont[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *MT,
        BoldFont = *-BoldMT,
        ItalicFont = *-ItalicMT,
        BoldItalicFont = *-BoldItalicMT
    ]{CourierNewPS}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf
    ]{CambriaMath}
    %% The default style for text is Tahoma (sans-serif).
    \renewcommand*\familydefault{\sfdefault}
    %% The default style for titles is Bookman Old Style (serif).
    \def\titlefont{\rmfamily}
    \def\titleshape{}
    \if@print
        \def\titlestyle{\titlefont\titleshape\bfseries}
    \else
        \def\titlestyle{\titlefont\titleshape}
    \fi
    \def\headerstyle{\titlestyle}
\fi

%% Define the OU house style colors.
\definecolor{ou-cyan}{cmyk}{1,0,0,0}
\definecolor{ou-black}{cmyk}{0,0,0,1}
\definecolor{ou-white}{cmyk}{0,0,0,0}
\definecolor{ou-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{ou-green}{cmyk}{1,0.15,0.4,0}
\definecolor{ou-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{ou-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{ou-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{ou-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{ou-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{ou-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{ou-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{ou-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{ou-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{ou-yellow}{cmyk}{0.02,0,0.54,0}

%% Use OU red as the color for titles, unless the 'print' option is
%% specified.
\if@print
    \colorlet{title}{black}
\else
%    \colorlet{title}{ou-cyan}
    \colorlet{title}{red}
\fi

%% We use A4 paper with slightly smaller margins than the default (scale = 0.7).
\geometry{a4paper,hscale=0.75,vscale=0.8}

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
    \def\@subtitle{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}
%% Redefine the author command to add the name to the PDF meta data.
\renewcommand*\author[1]{%
    \def\@author{#1}%
    \hypersetup{pdfauthor=#1}%
}
%% The affiliation is shown in the blue box on the front cover.
\newcommand*\affiliation[1]{\def\@affiliation{#1}}
%% The cover command is used to specify the filename of the optional cover
%% image.
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
%% The covertext command can be used to specify the text printed on the back
%% cover. This text is inserted in a minipage environment and can therefore
%% include line breaks.
\newcommand\covertext[1]{\def\@cover@text{#1}}

%% The cover image is scaled to fill the width of the front cover.
\newlength\@cover@imagewidth
%% The width of the spine if a back cover is present.
\newlength\@cover@spinewidth
\setlength\@cover@spinewidth{0.375in}
%% Width and height of the boxes on the front and back cover.
\newlength\@cover@frontboxwidth
\setlength\@cover@frontboxwidth{4.375in}
\newlength\@cover@frontboxheight
\setlength\@cover@frontboxheight{2.1875in}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\newlength\@cover@backboxwidth
\setlength\@cover@backboxwidth{4.375in}
\newlength\@cover@backboxheight
\setlength\@cover@backboxheight{2.1875in}
\newlength\@cover@backtextwidth
\newlength\@cover@backtextheight
%% Position on the front cover where the corner of both boxes meet.
\newlength\@cover@x
\setlength\@cover@x{0.8125in}
\newlength\@cover@y
\setlength\@cover@y{3in}
%% The margin around text boxes.
\newlength\@cover@margin
\setlength\@cover@margin{12pt}

%% Define the options for the makecover command.
\define@boolkey{cover}{back}[true]{}
\define@boolkey{cover}{nospine}[true]{}
\define@boolkey{cover}{frontbottom}[true]{}
\define@key{cover}{spinewidth}{\setlength\@cover@spinewidth{#1}}
\define@key{cover}{frontboxwidth}{\setlength\@cover@frontboxwidth{#1}}
\define@key{cover}{frontboxheight}{\setlength\@cover@frontboxheight{#1}}
\define@key{cover}{backboxwidth}{\setlength\@cover@backboxwidth{#1}}
\define@key{cover}{backboxheight}{\setlength\@cover@backboxheight{#1}}
\define@key{cover}{x}{\setlength\@cover@x{#1}}
\define@key{cover}{y}{\setlength\@cover@y{#1}}
\define@key{cover}{margin}{\setlength\@cover@margin{#1}}


%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[L,R]{\titlefont\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[R]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[L]{\titlefont\titleshape\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}


%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

\setlength{\headheight}{15pt}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}


%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\headerstyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{title}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\headerstyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\headerstyle}
    {}
    {0pt}
    {\color{title}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% Use a custom bibliography style based on apsrev4-1.
%\bibliographystyle{ou-report}
%\bibliographystyle{alpha}
% styles: apacite, abbrv, acm, alpha, apalike, ieeetr, plain, siam and unsrt.

%% Hyperlinks are title color, except in print mode, when they are all black.
\hypersetup{
    colorlinks = true,
    citecolor = title,
    linkcolor = title,
    urlcolor = title
}

\RequirePackage{csquotes}
