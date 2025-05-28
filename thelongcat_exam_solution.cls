%%% Usual Definitions %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thelongcat_exam_solution}[2025/05/28]
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
\RequirePackage{cancel} % Cross out cancelled terms
\RequirePackage{empheq} % For customised fancy cases environment (https://muscle-keisuke.hatenablog.com/entry/2015/11/23/122725)

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
\newcommand*{\diagfrac}[2]{%
	{{}^{#1}{\mskip -5mu/\mskip -3mu}_{#2}}
}

% A4 paper setup and custom image path
\geometry{a4paper, portrait}
\graphicspath{{Images/}}

% Alias for image attachment
\newcommand*{\image}[2]{%
	\begin{figure}[H]
		\centering
		\includegraphics[width=#1]{#2}
	\end{figure}
}

% Boldface the question numbering to match the Oxford style
% Reference: https://tex.stackexchange.com/a/329795
\renewcommand{\thequestion}{\bfseries\arabic{question}}

% Setup headers and footers with respect to the exam code
\newcommand*{\examcode}[1]{%
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
\newcommand*{\makeexamtitle}[2]{%
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
\newcommand*{\newquestion}{\newpage\question}

% Add custom line height to a matrix environment
% Reference: https://tex.stackexchange.com/a/14072
\makeatletter
\renewcommand*\env@matrix[1][\arraystretch]{%
  \edef\arraystretch{#1}%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{*\c@MaxMatrixCols c}}
\makeatother

% Aliases for answers in works
\newcommand*{\draft}{%
	\textbf{\color{red}(DRAFT)}
}
\newcommand*{\todo}{%
	\textbf{\color{red}(TO EXPAND)}
}

% Alias for texts following a line in math mode
\newcommand*{\mtext}[1]{\textnormal{\hspace{1em}#1}}

% Alias for \left...\right
\newcommand*{\avg}[1]{\left\langle{}#1{}\right\rangle}
\newcommand*{\evalat}[2]{\left.#1\right|_{#2}}
\newcommand*{\abs}[1]{\left|#1\right|}
\newcommand*{\rbracket}[1]{\left(#1\right)}
\newcommand*{\sbracket}[1]{\left[#1\right]}
\newcommand*{\cbracket}[1]{\left\{#1\right\}}

% Alias for atomic level labelling (e.g. ¹S₀)
\newcommand*{\level}[3][]{{}^{#2} {#3}_{#1}}

% Alias for chemical element (e.g. ¹²C)
\newcommand*{\element}[3][]{\textsuperscript{#3}\textsubscript{#1}{#2}}
% Ion (e.g. Ca²⁺)
\newcommand*{\ion}[2]{{#1}\textsuperscript{#2}}

% Aliases for particles
\newcommand*{\hole}{\mathrm{h}^{+}}
%%% Quarks %%%
\newcommand*{\Qup}{\mathrm{u}}
\newcommand*{\Qdown}{\mathrm{d}}
\newcommand*{\Qcharm}{\mathrm{c}}
\newcommand*{\Qstrange}{\mathrm{s}}
\newcommand*{\Qtop}{\mathrm{t}}
\newcommand*{\Qbottom}{\mathrm{b}}
%%% Elementary Bosons %%%
\newcommand*{\photon}{\gamma}
\newcommand*{\gluon}{\mathrm{g}}
\newcommand*{\Wp}{\mathrm{W}^{+}}
\newcommand*{\Wn}{\mathrm{W}^{-}}
\newcommand*{\Zz}{\mathrm{Z}^{0}}
\newcommand*{\higgs}{\mathrm{H}^{0}}
%%% Leptons %%%
\newcommand*{\electron}{\mathrm{e}^{-}}
\newcommand*{\positron}{\mathrm{e}^{+}}
\newcommand*{\muonp}{\mu^{+}}
\newcommand*{\muonn}{\mu^{-}}
\newcommand*{\taup}{\tau^{+}}
\newcommand*{\taun}{\tau^{-}}
\newcommand*{\neutrinoe}{\nu_\mathrm{e}}
\newcommand*{\neutrinom}{\nu_{\mu}}
\newcommand*{\neutrinot}{\nu_{\tau}}
\newcommand*{\aneutrinoe}{\bar{\nu}_\mathrm{e}}
\newcommand*{\aneutrinom}{\bar{\nu}_{\mu}}
\newcommand*{\aneutrinot}{\bar{\nu}_{\tau}}
%%% Mesons %%%
%% Pseudoscalar %%
\newcommand*{\piz}{\pi^{0}}
\newcommand*{\pip}{\pi^{+}}
\newcommand*{\pin}{\pi^{-}}
% \eta
\newcommand*{\etaPr}{\eta^{\prime}}
\newcommand*{\etac}{\eta_\mathrm{c}}
\newcommand*{\etab}{\eta_\mathrm{b}}
\newcommand*{\KzS}{\mathrm{K}_\mathrm{S}^{0}}
\newcommand*{\KzL}{\mathrm{K}_\mathrm{L}^{0}}
\newcommand*{\Kz}{\mathrm{K}^{0}}
\newcommand*{\Kp}{\mathrm{K}^{+}}
\newcommand*{\Kn}{\mathrm{K}^{-}}
\newcommand*{\Dz}{\mathrm{D}^{0}}
\newcommand*{\Dp}{\mathrm{D}^{+}}
\newcommand*{\Dn}{\mathrm{D}^{-}}
\newcommand*{\Dsp}{\mathrm{D}_\mathrm{s}^{+}}
\newcommand*{\Dsn}{\mathrm{D}_\mathrm{s}^{-}}
\newcommand*{\Bp}{\mathrm{B}^{+}}
\newcommand*{\Bz}{\mathrm{B}^{0}}
\newcommand*{\Bn}{\mathrm{B}^{-}}
\newcommand*{\Bsz}{\mathrm{B}_\mathrm{s}^{0}}
\newcommand*{\Bcp}{\mathrm{B}_\mathrm{c}^{+}}
\newcommand*{\Bcn}{\mathrm{B}_\mathrm{c}^{-}}
%% Vector %%
\newcommand*{\rhop}{\rho^{+}}
\newcommand*{\rhoz}{\rho^{0}}
\newcommand*{\rhon}{\rho^{-}}
% \omega
% \phi
\newcommand*{\JPsi}{\mathrm{J/\Psi}}
% \Upsilon
\newcommand*{\KKp}{\mathrm{K}^{*^{+}}}
\newcommand*{\KKz}{\mathrm{K}^{*^{0}}}
\newcommand*{\KKn}{\mathrm{K}^{*^{-}}}
\newcommand*{\DDp}{\mathrm{D}^{*^{+}}}
\newcommand*{\DDz}{\mathrm{D}^{*^{0}}}
\newcommand*{\DDn}{\mathrm{D}^{*^{-}}}
\newcommand*{\DDsp}{\mathrm{D}_\mathrm{s}^{*^{+}}}
\newcommand*{\DDsn}{\mathrm{D}_\mathrm{s}^{*^{-}}}
\newcommand*{\BBp}{\mathrm{B}^{*^{+}}}
\newcommand*{\BBz}{\mathrm{B}^{*^{0}}}
\newcommand*{\BBn}{\mathrm{B}^{*^{-}}}
\newcommand*{\BBsz}{\mathrm{B}_\mathrm{s}^{*^{0}}}
\newcommand*{\BBcp}{\mathrm{B}_\mathrm{c}^{*^{+}}}
\newcommand*{\BBcn}{\mathrm{B}_\mathrm{c}^{+^{-}}}
%%% Baryons %%%
%% J^P = 1/2+ %%
\newcommand*{\proton}{\mathrm{p}}
\newcommand*{\neutron}{\mathrm{n}}
\newcommand*{\Lambdaz}{\Lambda^{0}}
\newcommand*{\Lambdac}{\Lambda_{\mathrm{c}}^{+}}
\newcommand*{\Lambdab}{\Lambda_{\mathrm{b}}^{0}}
\newcommand*{\Sigmaz}{\Sigma^{0}}
\newcommand*{\Sigmap}{\Sigma^{+}}
\newcommand*{\Sigman}{\Sigma^{-}}
\newcommand*{\Sigmacpp}{\Sigma_\mathrm{c}^{++}}
\newcommand*{\Sigmacp}{\Sigma_\mathrm{c}^{+}}
\newcommand*{\Sigmacz}{\Sigma_\mathrm{c}^{0}}
\newcommand*{\Sigmabp}{\Sigma_\mathrm{b}^{+}}
\newcommand*{\Sigmabz}{\Sigma_\mathrm{b}^{0}}
\newcommand*{\Sigmabn}{\Sigma_\mathrm{b}^{-}}
\newcommand*{\Xiz}{\Xi^{0}}
\newcommand*{\Xin}{\Xi^{-}}
\newcommand*{\Xicp}{\Xi_\mathrm{c}^{+}}
\newcommand*{\Xicz}{\Xi_\mathrm{c}^{0}}
\newcommand*{\XicPrp}{\Xi_\mathrm{c}^{\prime^{+}}}
\newcommand*{\XicPrz}{\Xi_\mathrm{c}^{\prime^{0}}}
\newcommand*{\Xiccpp}{\Xi_\mathrm{cc}^{++}}
\newcommand*{\Xiccp}{\Xi_\mathrm{cc}^{+}}
\newcommand*{\Xibz}{\Xi_\mathrm{b}^{0}}
\newcommand*{\Xibn}{\Xi_\mathrm{b}^{-}}
\newcommand*{\XibPrz}{\Xi_\mathrm{b}^{\prime^{0}}}
\newcommand*{\XibPrn}{\Xi_\mathrm{b}^{\prime^{-}}}
\newcommand*{\Xibbz}{\Xi_\mathrm{bb}^{0}}
\newcommand*{\Xibbn}{\Xi_\mathrm{bb}^{-}}
\newcommand*{\Xicbp}{\Xi_\mathrm{cb}^{+}}
\newcommand*{\Xicbz}{\Xi_\mathrm{cb}^{0}}
\newcommand*{\XicbPrp}{\Xi_\mathrm{cb}^{\prime^{+}}}
\newcommand*{\XicbPrz}{\Xi_\mathrm{cb}^{\prime^{0}}}
\newcommand*{\Omegac}{\Omega_\mathrm{c}^{0}}
\newcommand*{\Omegab}{\Omega_\mathrm{b}^{-}}
\newcommand*{\Omegacc}{\Omega_\mathrm{cc}^{+}}
\newcommand*{\Omegacb}{\Omega_\mathrm{cb}^{0}}
\newcommand*{\OmegacbPr}{\Omega_\mathrm{cb}^{\prime^{0}}}
\newcommand*{\Omegabb}{\Omega_\mathrm{bb}^{-}}
\newcommand*{\Omegaccb}{\Omega_\mathrm{ccb}^{+}}
\newcommand*{\Omegacbb}{\Omega_\mathrm{cbb}^{0}}
%% J^P = 3/2+ %%
\newcommand*{\Deltapp}{\Delta^{++}}
\newcommand*{\Deltap}{\Delta^{+}}
\newcommand*{\Deltaz}{\Delta^{0}}
\newcommand*{\Deltan}{\Delta^{-}}
\newcommand*{\SSigmap}{\Sigma^{*^{+}}}
\newcommand*{\SSigmaz}{\Sigma^{*^{0}}}
\newcommand*{\SSigman}{\Sigma^{*^{-}}}
\newcommand*{\SSigmacpp}{\Sigma_\mathrm{c}^{*^{++}}}
\newcommand*{\SSigmacp}{\Sigma_\mathrm{c}^{*^{+}}}
\newcommand*{\SSigmacz}{\Sigma_\mathrm{c}^{*^{0}}}
\newcommand*{\SSigmabp}{\Sigma_\mathrm{b}^{*^{+}}}
\newcommand*{\SSigmabz}{\Sigma_\mathrm{b}^{*^{0}}}
\newcommand*{\SSigmabn}{\Sigma_\mathrm{b}^{*^{-}}}
\newcommand*{\XXiz}{\Xi^{*^{0}}}
\newcommand*{\XXin}{\Xi^{*^{-}}}
\newcommand*{\XXicp}{\Xi_\mathrm{c}^{*^{+}}}
\newcommand*{\XXicz}{\Xi_\mathrm{c}^{*^{0}}}
\newcommand*{\XXiccpp}{\Xi_\mathrm{cc}^{*^{++}}}
\newcommand*{\XXiccp}{\Xi_\mathrm{cc}^{*^{+}}}
\newcommand*{\XXibz}{\Xi_\mathrm{b}^{*^{0}}}
\newcommand*{\XXibn}{\Xi_\mathrm{b}^{*^{-}}}
\newcommand*{\XXibbz}{\Xi_\mathrm{bb}^{*^{0}}}
\newcommand*{\XXibbn}{\Xi_\mathrm{bb}^{*^{-}}}
\newcommand*{\XXicbp}{\Xi_\mathrm{cb}^{*^{+}}}
\newcommand*{\XXicbz}{\Xi_\mathrm{cb}^{*^{0}}}
\newcommand*{\Omegan}{\Omega^{-}}
\newcommand*{\OOmegac}{\Omega_\mathrm{c}^{*^{0}}}
\newcommand*{\OOmegab}{\Omega_\mathrm{b}^{*^{-}}}
\newcommand*{\OOmegacc}{\Omega_\mathrm{cc}^{*^{+}}}
\newcommand*{\OOmegacb}{\Omega_\mathrm{cb}^{*^{0}}}
\newcommand*{\OOmegabb}{\Omega_\mathrm{bb}^{*^{-}}}
\newcommand*{\Omegaccc}{\Omega_\mathrm{ccc}^{++}}
\newcommand*{\OOmegaccb}{\Omega_\mathrm{ccb}^{*^{+}}}
\newcommand*{\OOmegacbb}{\Omega_\mathrm{cbb}^{*^{0}}}
\newcommand*{\Omegabbb}{\Omega_\mathrm{bbb}^{-}}

% Aliases for derivatives and integrals
\newcommand*{\deri}[3][]{\frac{\mathrm{d}^{#1}{#2}}{\mathrm{d}{#3}^{#1}}}
\newcommand*{\diff}[2][]{\frac{\mathrm{d}^{#1}}{\mathrm{d}{#2}^{#1}}}
\newcommand*{\dderi}[3][]{\dfrac{\mathrm{d}^{#1}{#2}}{\mathrm{d}{#3}^{#1}}}
\newcommand*{\ddiff}[2][]{\dfrac{\mathrm{d}^{#1}}{\mathrm{d}{#2}^{#1}}}
\newcommand*{\diagderi}[3][]{\diagfrac{\mathrm{d}^{#1}{#2}}{\mathrm{d}{#3}^{#1}}}
\newcommand*{\diagdiff}[2][]{\diagfrac{\mathrm{d}^{#1}}{\mathrm{d}{#2}^{#1}}}
\newcommand*{\pderi}[3][]{\frac{\partial^{#1}{#2}}{\partial{}{#3}^{#1}}}
\newcommand*{\pdiff}[2][]{\frac{\partial^{#1}}{\partial{}{#2}^{#1}}}
\newcommand*{\pdderi}[3][]{\dfrac{\partial^{#1}{#2}}{\partial{}{#3}^{#1}}}
\newcommand*{\pddiff}[2][]{\dfrac{\partial^{#1}}{\partial{}{#2}^{#1}}}
\newcommand*{\pdiagderi}[3][]{\diagfrac{\partial^{#1}{#2}}{\partial{}{#3}^{#1}}}
\newcommand*{\pdiagdiff}[2][]{\diagfrac{\partial^{#1}}{\partial{}{#2}^{#1}}}
\newcommand*{\defint}[4]{\int_{#1}^{#2} {#3} \,\mathrm{d}{#4}}
\newcommand*{\indefint}[2]{\int {#1} \,\mathrm{d}{#2}}
\newcommand*{\inftsml}[1]{\,\mathrm{d}{#1}}
\newcommand*{\dbar}{{d\mkern-7mu\mathchar'26\mkern-2mu}} % https://tex.stackexchange.com/a/253108
\newcommand*{\inftsmlbar}[1]{\,\mathrm{\dbar}{#1}}

% Aliases for trigonometric and hyperbolic funcs not defined by default
\DeclareMathOperator{\sinc}{sinc}
\DeclareMathOperator{\cosec}{cosec}
\DeclareMathOperator{\sech}{sech}
\DeclareMathOperator{\cosech}{cosech}
\DeclareMathOperator{\arsinh}{arsinh}
\DeclareMathOperator{\arcosh}{arcosh}
\DeclareMathOperator{\artanh}{artanh}
\DeclareMathOperator{\arcoth}{arcoth}
\DeclareMathOperator{\arsech}{arsech}
\DeclareMathOperator{\arcsch}{arcsch}

% A couple of mathematical and physical constants
\newcommand*{\masselectron}{m_\mathrm{e}}
\newcommand*{\masshole}{m_\mathrm{h}}
\newcommand*{\massproton}{m_\mathrm{p}}
\newcommand*{\massneutron}{m_\mathrm{n}}
\newcommand*{\permittivity}{\epsilon_{0}}
\newcommand*{\permeability}{\mu_{0}}
\newcommand*{\bohrmagneton}{\mu_\mathrm{B}}
\newcommand*{\nuclearmagneton}{\mu_\mathrm{N}}
\newcommand*{\protonmagmt}{\mu_\mathrm{p}}
\newcommand*{\neutronmagmt}{\mu_\mathrm{n}}
\newcommand*{\boltzmann}{k_\mathrm{B}}
\newcommand*{\avogadro}{N_\mathrm{A}}
\newcommand*{\thomsonxsec}{\sigma_\mathrm{T}}
\newcommand*{\comptonelectron}{\lambda_\mathrm{C}}
\newcommand*{\nbose}{n_\mathrm{B}}
\newcommand*{\nfermi}{n_\mathrm{F}}

% Custom siunitx units
\DeclareSIUnit\day{d}
\DeclareSIUnit\month{mo}
\DeclareSIUnit\year{yr}
\DeclareSIUnit\angstrom{\textup{\AA}} % https://tex.stackexchange.com/a/24278
\DeclareSIUnit\fermi{\femto\metre}
\DeclareSIUnit\barn{b}
\DeclareSIUnit\AU{AU}
\DeclareSIUnit\parsec{pc}
\DeclareSIUnit\atm{atm}
