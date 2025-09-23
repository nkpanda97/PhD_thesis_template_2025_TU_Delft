% ---------------------
% This is an unofficial LaTeX template for writing a PhD thesis at TU Delft. It is based on the official TU Delft report class, but has been heavily modified to improve usability and to simplify customization. The template is designed to meet the requirements of the TU Delft house style as of 2025.

% Note: This template is not officially endorsed by TU Delft. Please check the latest guidelines from TU Delft for writing a PhD thesis, as they may change over time. But this can be a good starting point.

% Features:

% Specifically designed for PhD theses at TU Delft

% Clean and modern design

% Customizable title page

% Support for multiple languages (English and Dutch) for the title page

% Predefined commands for common elements such as abstract, acknowledgements, etc.

% Easy to use and modify

% Styles for use within chapters for keywords, definitions, theorems, etc.

% Support for including code snippets with syntax highlighting

% Textbox environment for highlighting important information

% This template is compatible with pdfLaTeX, XeLaTeX, and LuaLaTeX. To comply with the TU Delft house style, however, you should use either XeLaTeX or LuaLaTeX, since these engines support TrueType and OpenType fonts. The bibliography is handled with BibLaTeX, using biber as the backend.

% Acknowledgement:

% The following template is mainly based on the report template by Daniel Zwanenveld, which can be found at https://dzwaneveld.github.io/
% . You can also refer there for full documentation of the report class.

% Usage:

% This template can be used standalone in any LaTeX editor. Simply download the repository and open the report.tex file. You can then modify the content to fit your needs. You can also copy the tudreport.cls file to your local LaTeX directory to use it in other projects. Make sure to have the required packages installed. You can find a list of required packages in the tudreport.cls file. Moreover, you can use an online LaTeX editor like Overleaf and upload the files there.

%% ----------------------------------------------------------------------
%%    Setting up the class, main packages and basic definitions
%% ----------------------------------------------------------------------

%% Class is based on the default book class, and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout/PhD_thesis_template_2025_TU_Delft}[23-09-2025 v1.0 TU Delft Modified Report Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[10pt,oneside]{book}

%% Main packages in the document --- Some are imported later in the class file
\RequirePackage{mathtools}  % Mathematical tools to use with amsmath
\RequirePackage{amssymb}    % Extended symbol collection
\RequirePackage{siunitx}    % Comprehensive (SI) units package

\RequirePackage{tabularx}   % Tabulars with adjustable-width columns
\RequirePackage{booktabs}   % Publication quality tables
\RequirePackage{longtable}  % Allow tables to flow over page boundaries
\RequirePackage{multirow}   % Create tabular cells spanning multiple rows

\RequirePackage{graphicx}   % Enhanced support for images
\RequirePackage{float}      % Improved interface for floating objects
\RequirePackage[labelfont=bf,justification=centering,footnotesize]{caption} % Captions
\RequirePackage{subcaption} % Support for sub-captions
\RequirePackage{pdfpages}   % Include PDF documents

\RequirePackage[pdfusetitle,hidelinks]{hyperref} % Extensive support for hypertext
\RequirePackage[noabbrev]{cleveref} % Intelligent cross-referencing
\RequirePackage{xcolor}     % Driver-independent color extensions
\RequirePackage{tikz}       % Create PostScript and PDF graphics
\RequirePackage{xspace}     % Define commands that appear not to eat spaces
\RequirePackage{microtype}  % Refinements towards typographical perfection

\RequirePackage{geometry}   % Customize document dimensions
\RequirePackage{titlesec}   % Select alternative section titles
\RequirePackage{titletoc}   % Alternative headings for toc
\RequirePackage{fancyhdr}   % Control of page headers and footers
\RequirePackage{enumitem}   % Control layout of itemize, enumerate, description
\RequirePackage{etoolbox}   % Toolbox of programming facilities
\RequirePackage{iftex}      % Adds if-else statements to support multiple compilers
\RequirePackage{datetime}   % Change format of \today

%% Establish commands for the subtitle, subject, affiliation, cover image and table of authors
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\subject}[1]{\def\@subject{#1}}
\newcommand*{\affiliation}[1]{\def\@affiliation{#1}}
\newcommand*{\coverimage}[1]{\def\@coverimage{#1}}
\newcommand*{\covertable}[1]{\def\@covertable{#1}}

%% Scale the margins to be slightly smaller than default (.7)
\geometry{paperwidth=17cm,
  paperheight=24cm,,hscale=0.75,vscale=0.8}

%% ----------------------------------------------------------------------
%%    Setting up the fonts
%% ----------------------------------------------------------------------

\ifPDFTeX
    %% With pdfLaTeX, use Paletino as the main font and Roboto Slab as title fonts
    \RequirePackage[T1]{fontenc}  % Select T1 font encoding
    \RequirePackage{newpxtext}    % Palatino-like font...
    \RequirePackage{newpxmath}    % ...with support for mathematics

    % \newcommand{\titlestyle}{\fontfamily{Roboto}\fontseries{bold}\selectfont}
    \newcommand{\titlestyle}{\fontfamily{phv}\fontseries{b}\selectfont}
    \newcommand{\largetitlestyle}{\fontfamily{phv}\fontseries{c}\selectfont}
\else
    %% If XeLaTeX or LuaLaTeX is set as the compiler, the TU Delft house style fonts are used (see https://www.tudelft.nl/huisstijl/bouwstenen/typografie).
    \RequirePackage{fontspec} % Advanced font selection
    \RequirePackage{titlesec}

    %% Use Arial as the main font and Roboto Slab as title fonts
    \setmainfont{EB Garamond}
    \newfontfamily\titlestyle{Roboto Light}
    \setmathsf{Arial}
    \setmathtt{Arial}


\fi

%% ----------------------------------------------------------------------
%%    Formatting the titles and table of contents
%% ----------------------------------------------------------------------

%% Format the chapter titles and spacing
\titleformat{\chapter}[display]
    {\flushright}
    {\fontsize{96}{96}\selectfont\largetitlestyle\thechapter}
    {0pt}
    {\Huge\titlestyle}
\titlespacing*{\chapter}{0pt}{0pt}{2\baselineskip}

%% Format the section titles and spacing
\titleformat{\section}
    {\Large\titlestyle\bfseries}
    {\thesection.}
    {5pt}
    {}
\titlespacing*{\section}{0pt}{\baselineskip}{0pt}

%% Format the subsections titles and spacing
\titleformat{\subsection}
    {\large\titlestyle\bfseries}
    {\thesubsection.}
    {5pt}
    {}
\titlespacing*{\subsection}{0pt}{\baselineskip}{0pt}

%% Format the subsubsections titles and spacing
\titleformat{\subsubsection}
    {\titlestyle\bfseries}
    {}
    {0pt}
    {}
\titlespacing*{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Reduce the vertical white space between chapters in the table of contents
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\bfseries}{1.5em}{0pt}

%% ----------------------------------------------------------------------
%%    Formatting the header and footer
%% ----------------------------------------------------------------------

%% Format the header and footer of 'plain' pages
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{\titlestyle\thepage}}

%% Format the header and footer of 'fancy' pages (based on twoside option)
\if@twoside
    \fancyhf{}
    \fancyhead[LE,RO]{\titlestyle\thepage}
    \fancyhead[RE]{\titlestyle\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlestyle\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Remove header and footer on empty pages
\else
    \fancyhf{}
    \fancyhead[R]{\titlestyle\thepage}
    \fancyhead[L]{\titlestyle\nouppercase{\rightmark}}
\fi

\pagestyle{fancy} % Set the package defaults and the additional changes as the style

%% ----------------------------------------------------------------------
%%    Setting up the \makecover command for the cover page
%% ----------------------------------------------------------------------

\newcommand*{\makecover}{
    %% Use the Tikz library positioning and clear the page header and footer
    \usetikzlibrary{positioning}
    \thispagestyle{empty}

    %% Construct the cover page with Tikz
    \begin{tikzpicture}[overlay,remember picture]

        %% Add the cover image
        \node[above=0,inner sep=0] at (current page.south) {%
            \includegraphics[width=\paperwidth]{\@coverimage}};

        %% Add the affiliation on the left
        % \node[rotate=90,below right=40mm and 3mm] at (current page.west) {%
        %     \ifdefvoid{\@affiliation}{}{\color{white}\titlestyle\@affiliation}};

        %% Add the logo in the bottom left
        \node[above right=10mm] at (current page.south west) {%
            \includegraphics[width=0.35\linewidth]{layout/tudelft/logo-white.pdf}};

        %% Add the banner with the title, subtitle, subject and author(s)
        \node[below=2cm,fill=black!85,minimum width={\paperwidth},inner ysep=25pt,opacity=0.7,text opacity=1] at (current page.north) {%
            \begin{minipage}{0.9\paperwidth}
                %% Format and add the title
                \color{white}\raggedright\largetitlestyle\fontsize{60}{60}\selectfont%
                    \@title \\[0.5ex]
                %% Format and add (optional) subtitle and subject
                \color{white}\titlestyle\fontsize{22}{22}\selectfont%
                    \ifdefvoid{\@subtitle}{}{\@subtitle \\[2.5ex]}%
                    \ifdefvoid{\@subject}{}{\@subject \\[0.5ex]}
                %% Format and add author or table of authors
                \largetitlestyle\fontsize{24}{24}\selectfont%
                    \ifdefvoid{\@covertable}{\@author}{\@covertable}
            \end{minipage}};

    \end{tikzpicture}
    \newpage
}

%% ----------------------------------------------------------------------
%%    Setting up listings
%% ----------------------------------------------------------------------

\RequirePackage{listings} % Typeset source code listings

\lstset{
  basicstyle=\ttfamily\footnotesize,  % Style of the font that is used for the code
  backgroundcolor=\color{gray!10},    % Background color
  keywordstyle=\color{red!75!black},  % Keyword style
  stringstyle=\color{green!40!black}, % String style
  commentstyle=\color{blue!30!black}, % Comment style
  numbers=left,                       % Add line numbers on the left side
  numbersep=5pt,                      % Decrease distance between line numbers and code
  numberstyle=\tiny,                  % Line number style
  breaklines=true,                    % Line break automatically
}

