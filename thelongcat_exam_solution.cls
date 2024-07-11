%%% Usual Definitions %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thelongcat_exam_solution}[2024/06/18]
\LoadClass[12pt]{exam}

%%% Load Packages %%%
\RequirePackage{geometry} % Modifies the geometry of the paper
\RequirePackage[UKenglish]{isodate} % Gives date in British format
\RequirePackage{amsmath} % Provides various environments for maths (e.g. equation)
\RequirePackage{amsthm} % Provides theorem structure
\RequirePackage{amssymb} % Provides mathematical symbols
\RequirePackage{graphicx} % Provides image embedding
\RequirePackage{minted} % Provides code-formatting functionality
\RequirePackage{hyperref} % Just hyperlink
\RequirePackage[parfill]{parskip} % No indent for new paragraphs
\RequirePackage{float} % Gives absolute float option in figure environment
\RequirePackage{mathtools} % Quality-of-life improvement for amsmath (introduces \xRightarrow etc.)
\RequirePackage{caption} % Gives caption
\RequirePackage{subcaption} % Gives sub-figure and sub-caption environments
\RequirePackage{gensymb} % Gives symbols such as degree symbol (º)
\RequirePackage{siunitx} % Provides unit annotation
\RequirePackage{array} % Centered justified columns in tabular
\RequirePackage{bm} % Bold symbols not supported by \mathbf
\RequirePackage{multicol} % Provides multi-column layout
\RequirePackage{mdframed} % Custom box borders
\RequirePackage{braket} % Said to be Dirac's best joke
\RequirePackage{dsfont} % For blackboard bold numerals, e.g. 𝟙 for identity

% Reference: https://tex.stackexchange.com/a/5020
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% Set larger \headheight to silence fancyhdr warning
% See https://tex.stackexchange.com/a/327298
\setlength{\headheight}{13.59999pt}

% Separate uncertainty explicitly
% See https://tex.stackexchange.com/a/27707
\sisetup{separate-uncertainty=true}

% Setup diagonal fractions
% Reference: https://tex.stackexchange.com/a/251123
\newcommand{\diagfrac}[2]{
	{{}^{#1}{\mskip -5mu/\mskip -3mu}_{#2}}
}

% A4 paper setup and custom image path
\geometry{a4paper, portrait}
\graphicspath{{Images/}}

% Boldface the question numbering to match the Oxford style
% Reference: https://tex.stackexchange.com/a/329795
\renewcommand{\thequestion}{\bfseries\arabic{question}}

% Setup headers and footers with respect to the exam code
\newcommand{\examcode}[1]{
	\pagestyle{headandfoot}
	\headrule
	\header{#1 Solution}{}{\today}
	\footer{}{\thepage}{}
	\def\title{\hrule \hspace{1em} \textbf{#1 Solution} \hspace{1em} \hrule}
	\author{\textbf{The Long Cat}}
	\date{\textbf{Last updated: \today}}
}

% Box with top and bottom borders
% Reference: https://tex.stackexchange.com/a/40315
\newmdenv[leftline=false, rightline=false, linewidth=.5pt]{topbot}

% Custom maketitle for the cover page
\newcommand{\makeexamtitle}[2]{
	\begin{coverpages}
		\begin{center}
			\centering
			\vspace*{3em}
			
			\textbf{UNOFFICIAL SOLUTIONS BY TheLongCat}
			\vspace{3em}
			
			\begin{topbot}
				\centering
				\vspace{1em}
				\textbf{#1}
				\vspace{1em}
			\end{topbot}
			
			\vspace{1.5em}
			\textbf{#2}
			\vspace{1em}
			
			\textbf{Last updated: \today}
			\vspace{5em}
			
			\textit{Disclaimer: due to its unofficial nature, the author does not warrant the accuracy of the presented solutions in any form. However, the author is happy to discuss the typos and errors should one arises.}
			\vspace{3em}
			
			\textbf{Turn over as you please -- we are NOT under exam conditions here.}
		\end{center}
	\end{coverpages}
	\newpage
	\newgeometry{left=1.5cm, right=1.5cm, top=2.5cm, bottom=2.5cm}
}

% Convience command for new page for each question
\newcommand{\newquestion}{\newpage\question}

% Add custom line height to a matrix environment
% Reference: https://tex.stackexchange.com/a/14072
\makeatletter
\renewcommand*\env@matrix[1][\arraystretch]{%
  \edef\arraystretch{#1}%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{*\c@MaxMatrixCols c}}
\makeatother
