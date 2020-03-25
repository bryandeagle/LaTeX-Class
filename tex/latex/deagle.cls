%---------------------------------------------------------------------------------
%	BASE CLASS OFF OF ARTICLE CLASS
%---------------------------------------------------------------------------------

\LoadClass{article}

%---------------------------------------------------------------------------------
% PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%---------------------------------------------------------------------------------

\usepackage{amsmath,amsfonts,stmaryrd,amssymb}
\usepackage{enumerate}
\usepackage[ruled]{algorithm2e}
\usepackage[framemethod=tikz]{mdframed}
\usepackage{listings}
\lstset{basicstyle=\ttfamily}
\usepackage{parskip}
\usepackage[hidelinks]{hyperref}
\usepackage{xcolor}
\usepackage[english]{babel}
\usepackage{blindtext}
\usepackage{tabularx}
\usepackage{datetime}
\usepackage{lipsum}
\usepackage[super]{nth}
\usepackage{cite}
\usepackage[nochapter]{vhistory}

%---------------------------------------------------------------------------------
%	CUSTOM COMMANDS
%---------------------------------------------------------------------------------

\newdateformat{monthyeardate}{\monthname[\THEMONTH] \THEYEAR}
\newcommand{\lipsent}{Lorem ipsum dolor sit amet, consectetuer adipiscing elit.}
\newcommand{\lippar}{Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut purus elit, vestibulum ut, placerat ac, adip-iscing vitae, felis. Curabitur dictum gravida mauris. Nam arcu libero, nonummy eget, consectetuer id,vulputate a, magna. Donec vehicula augue eu neque. Pellentesque habitant morbi tristique senectus etnetus et malesuada fames ac turpis egestas. Mauris ut leo. Cras viverra metus rhoncus sem.}

%---------------------------------------------------------------------------------
%	HYPERLINKS
%---------------------------------------------------------------------------------

\hypersetup{
    colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}
}

%---------------------------------------------------------------------------------
%	DOCUMENT MARGINS
%---------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=letterpaper, % Paper size, change to letterpaper for US letter size
	top=1in, % Top margin
	bottom=1in, % Bottom margin
	left=1in, % Left margin
	right=1in, % Right margin
	headheight=14pt, % Header height
	footskip=1.5cm, % Space from the bottom margin to the baseline of the footer
	headsep=1.2cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

%---------------------------------------------------------------------------------
%	CUSTOMIZE TITLE
%---------------------------------------------------------------------------------

\date{\vspace{-5ex}}
\author{\vspace{-5ex}}

%---------------------------------------------------------------------------------
%	FONTS
%---------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage{XCharter} % Use the XCharter fonts
\usepackage[scaled=0.85]{beramono}

%---------------------------------------------------------------------------------
%	CENTERED TABLE
%---------------------------------------------------------------------------------

% Define a custom environment for centered tables
\newenvironment{ctable}[1]{
	\medskip
	\tabularx{\textwidth}{|*{#1}{>{\centering\arraybackslash}X|}}
	\hline
}{
	\endtabularx
	\medskip
}

%---------------------------------------------------------------------------------
%	COMMAND LINE ENVIRONMENT
%---------------------------------------------------------------------------------

\mdfdefinestyle{commandline}{
	leftmargin=0.5in,
	rightmargin=0.5in,
	innerleftmargin=15pt,
	middlelinecolor=black!50!white,
	middlelinewidth=1pt,
	frametitlerule=false,
	backgroundcolor=black!5!white,
	frametitle={Command Line},
	frametitlefont={\normalfont\sffamily\color{white}\hspace{-1em}},
	frametitlebackgroundcolor=black!50!white,
	nobreak,
}

% Define a custom environment for command-line snapshots
\newenvironment{commandline}{
	\medskip
	\begin{mdframed}[style=commandline]
}{
	\end{mdframed}
	\medskip
}

%---------------------------------------------------------------------------------
%	FILE CONTENTS ENVIRONMENT
%---------------------------------------------------------------------------------

% Usage:
% \begin{file}[optional filename, defaults to "File"]
%	File contents, for example, with a listings environment
% \end{file}

\mdfdefinestyle{file}{
	innertopmargin=1.6\baselineskip,
	innerbottommargin=0.8\baselineskip,
	topline=false, bottomline=false,
	leftline=false, rightline=false,
	leftmargin=0.5in,
	rightmargin=0.5in,
	singleextra={%
		\draw[fill=black!10!white](P)++(0,-1.2em)rectangle(P-|O);
		\node[anchor=north west]
		at(P-|O){\ttfamily\mdfilename};
		%
		\def\l{3em}
		\draw(O-|P)++(-\l,0)--++(\l,\l)--(P)--(P-|O)--(O)--cycle;
		\draw(O-|P)++(-\l,0)--++(0,\l)--++(\l,0);
	},
	nobreak,
}

% Define a custom environment for file contents
\newenvironment{file}[1][File]{ % Set the default filename to "File"
	\medskip
	\newcommand{\mdfilename}{#1}
	\begin{mdframed}[style=file]
}{
	\end{mdframed}
	\medskip
}

%---------------------------------------------------------------------------------
%	NUMBERED QUESTIONS ENVIRONMENT
%---------------------------------------------------------------------------------

% Usage:
% \begin{question}[optional title]
%	Question contents
% \end{question}

\mdfdefinestyle{question}{
	innertopmargin=1.2\baselineskip,
	innerbottommargin=0.8\baselineskip,
	roundcorner=5pt,
	nobreak,
	singleextra={%
		\draw(P-|O)node[xshift=1em,anchor=west,fill=white,draw,rounded corners=5pt]{%
		Question \theQuestion\questionTitle};
	},
}

\newcounter{Question} % Stores the current question number that gets iterated with each new question

% Define a custom environment for numbered questions
\newenvironment{question}[1][\unskip]{
	\bigskip
	\stepcounter{Question}
	\newcommand{\questionTitle}{~#1}
	\begin{mdframed}[style=question]
}{
	\end{mdframed}
	\medskip
}

%---------------------------------------------------------------------------------
%	WARNING TEXT ENVIRONMENT
%---------------------------------------------------------------------------------

% Usage:
% \begin{warn}[optional title, defaults to "Warning:"]
%	Contents
% \end{warn}

\mdfdefinestyle{warning}{
	topline=false, bottomline=false,
	leftline=false, rightline=false,
	nobreak,
	singleextra={%
		\draw(P-|O)++(-0.5em,0)node(tmp1){};
		\draw(P-|O)++(0.5em,0)node(tmp2){};
		\fill[black,rotate around={45:(P-|O)}](tmp1)rectangle(tmp2);
		\node at(P-|O){\color{white}\scriptsize\bf !};
		\draw[very thick](P-|O)++(0,-1em)--(O);%--(O-|P);
	}
}

% Define a custom environment for warning text
\newenvironment{warn}[1][Warning:]{ % Set the default warning to "Warning:"
	\medskip
	\begin{mdframed}[style=warning]
		\noindent{\textbf{#1}}
}{
	\end{mdframed}
}

%---------------------------------------------------------------------------------
%	INFORMATION ENVIRONMENT
%---------------------------------------------------------------------------------

% Usage:
% \begin{info}[optional title, defaults to "Info:"]
% 	contents
% 	\end{info}

\mdfdefinestyle{info}{%
	topline=false, bottomline=false,
	leftline=false, rightline=false,
	nobreak,
	singleextra={%
		\fill[black](P-|O)circle[radius=0.4em];
		\node at(P-|O){\color{white}\scriptsize\bf i};
		\draw[very thick](P-|O)++(0,-0.8em)--(O);%--(O-|P);
	}
}

% Define a custom environment for information
\newenvironment{info}[1][Info:]{ % Set the default title to "Info:"
	\medskip
	\begin{mdframed}[style=info]
		\noindent{\textbf{#1}}
}{
	\end{mdframed}
}
