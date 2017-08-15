\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_resume}[15/08/2017 custom resume class]
\LoadClassWithOptions{extarticle}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{everypage}
\RequirePackage{xcolor}
\RequirePackage{svg}

\RequirePackage{tgadventor}
%\RequirePackage{tgheros}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}

% ----------------------------------------------------------------------
% -------------------------- LaTeX Formatting --------------------------
% ----------------------------------------------------------------------

\definecolor{color1}{RGB}{100,130,220}

% THESE ARE LaTeX DEFAULTS; CAN CHANGE IF NEEDED.
\def\PageTopMargin{1.25in}
\def\PageBottomMargin{0.4in}
\def\PageLeftMargin{0.6in}
\def\PageRightMargin{0.6in}

\newlength\inset
\inset=\PageLeftMargin\relax

\RequirePackage[top=\PageTopMargin, bottom=\PageBottomMargin, left=\PageLeftMargin, right=\PageRightMargin]{geometry}

% ------------------------- Section Formatting -------------------------
\titleformat{\section}
{\normalfont\scshape\LARGE}{\thesection}{}{}
\titlespacing*{\section}
{0pt}{2pt}{1pt} % left, top, bottom

\setlist[itemize]{itemsep=-4pt, topsep=1pt, leftmargin=10pt}

% ----------------------------------------------------------------------

\newcommand\TwoColBox[3]{
	\centering\makebox[0pt]{%
		\colorbox{#1}{
			\parbox{\paperwidth}{
				\leftskip=\inset\rightskip=\inset%
				\begin{minipage}[t]{\dimexpr.485\paperwidth-\inset}\strut#2\end{minipage}%
				\hspace{.03\paperwidth}%
				\begin{minipage}[t]{\dimexpr.485\paperwidth-\inset}\strut#3\end{minipage}%
			}
		}
	}
	\par
}

\newcommand\BottomBar[2]{%
	\AddEverypageHook{
		\smash{
			\hspace*{
				\dimexpr-\PageLeftMargin-0.48in
			}%
			\raisebox{
				\dimexpr\PageTopMargin-11.2in\relax
			}{
				\colorbox{#1}{%
					\parbox{\paperwidth}{
						\leftskip=\inset\rightskip=\inset
						\strut
						\vspace{-.09in} \\
						\textcolor{white}{#2}
						\vspace{.12in}
					}
				}
			}
		}
	}
}

\newcommand\PositionEntry[4]{% dates, title, location, description
	\underline{\smash{#1}}\vspace{0.2em}\\%
	{\bf #2} - #3%
	#4%
}

\newcommand\DiplomaEntry[6]{% dates, diploma, extras+GPA, institution, location, description
	\underline{\smash{#1}}\vspace{0.2em}\\%
	{\bf #2}#3\\%
	{\bf #4} - #5\\%
	#6
}

\newcommand\SimpleDiplomaEntry[4]{% dates, diploma, extras+GPA, institution, location, description
	\underline{\smash{#1}}\vspace{0.2em}\\%
	{\bf #2}\\%
	{\bf #3} - #4%
}

\newcommand\SkillEntry[2]{%
	\underline{\smash{#1}}\vspace{1.5pt}\\%
	#2\vspace{1pt}\\%
}

\newcommand\BibEntry[2]{
	$\left[#1\right]$\hspace*{.8mm}%
	#2
}

\newcommand\EntrySpacing{\vspace{3pt}}

% ----------------------- Header bar -------------------------
\newcommand\HeaderBar[4] {% Name + title, description, phone, email
\smash{
	\hspace*{
		\dimexpr-\PageLeftMargin-0.144in
	}%
	\raisebox{
		\dimexpr\PageTopMargin-.64in\relax
	}{
		\colorbox{color1}{%
			\parbox{\paperwidth}{
				\leftskip=\inset\rightskip=\inset
				\vspace{0.75in}
				\strut
				% ----------- Here is the name and personal info -------------	
				\begin{minipage}[t]{\dimexpr.62\paperwidth-\inset}
					\textcolor{white}{
						{\huge \textbf{#1}}
						\vspace{0.05in} \\
						{\large #2}
					}
				\end{minipage}%
				\hspace{.06\paperwidth}%
				\begin{minipage}[t]{\dimexpr.35\paperwidth-\inset}
					{\large
						\vspace{0.062in}
						\textcolor{white}{
							\raisebox{-.16\height}{
								\includesvg[width=0.06\textwidth]{smartphone}
							}
							#3 \\
							\raisebox{-.16\height}{
								\includesvg[width=0.06\textwidth]{mail}
							}
							#4
						}
					}
				\end{minipage}
				\vspace{0.3in}
			}
		}
	}
}
}

% VERIFIED THAT SETTING \hoffset AND \voffset DO NOT BREAK SOLUTION.
%\hoffset=0.4in
%\voffset=0.2in

%\MyHeader{.65in}{color1}{
%	Header text
%}

%\BottomBar{color1}{Maybe some text}
\BottomBar{color1}{}
