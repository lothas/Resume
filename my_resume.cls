\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_resume}[15/08/2017 custom resume class]
\newif\ifmultipage
\@ifclasswith{my_resume}{multipage}{\multipagetrue}{\multipagefalse}

\ifmultipage
   \LoadClass[10pt]{extarticle}
\else
   \LoadClass[8pt]{extarticle}
\fi
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{everypage}
\RequirePackage{xcolor}
\RequirePackage{svg} % enable --shell-escape for pdflatex
\RequirePackage[hidelinks]{hyperref}

\RequirePackage{helvet}
%\RequirePackage{tgadventor}
%\RequirePackage{tgheros}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\RequirePackage[T1]{fontenc}

% ----------------------------------------------------------------------
% -------------------------- LaTeX Formatting --------------------------
% ----------------------------------------------------------------------

\definecolor{color1}{RGB}{95,110,180}

% THESE ARE LaTeX DEFAULTS; CAN CHANGE IF NEEDED.
\ifmultipage
   \def\PageTopMargin{0.8in}
   \def\PageBottomMargin{0.6in}
   \def\PageLeftMargin{0.8in}
   \def\PageRightMargin{0.8in}
\else
   \def\PageTopMargin{1.25in}
   \def\PageBottomMargin{0.4in}
   \def\PageLeftMargin{0.6in}
   \def\PageRightMargin{0.6in}
\fi

\newlength\inset
\inset=\PageLeftMargin\relax

\RequirePackage[top=\PageTopMargin, bottom=\PageBottomMargin, left=\PageLeftMargin, right=\PageRightMargin]{geometry}

\hypersetup{
	colorlinks=false
}
% ------------------------- Section Formatting -------------------------
\ifmultipage
	\titleformat{\section}
	{\normalfont\scshape\large\bfseries\color{color1}\centering}{\thesection}{}{}
	\titlespacing*{\section}
	{0pt}{8pt}{1pt} % left, top, bottom
\else
	\titleformat{\section}
	{\normalfont\scshape\Large\bfseries\color{color1}}{\thesection}{}{}
	\titlespacing*{\section}
	{0pt}{3pt}{1pt} % left, top, bottom
\fi

\setlist[itemize]{itemsep=-4pt, topsep=1pt, leftmargin=10pt}

% ----------------------------------------------------------------------
\ifmultipage
	\newcommand\MainContent[3]{
		\vspace{0.8in}
		#2\\%
		#3
	}
\else
	\newcommand\MainContent[3]{
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
\fi

\newcommand\TopBar[2]{%
	\AddEverypageHook{
		\smash{
			\hspace*{
				\ifmultipage
				\dimexpr-\PageLeftMargin-0.4in
				\else
				\dimexpr-\PageLeftMargin-0.48in
				\fi
			}%
			\raisebox{
				\ifmultipage
				\dimexpr\PageTopMargin+0.02in\relax
				\else
				\dimexpr\PageTopMargin-0.1in\relax
				\fi
			}{
			\colorbox{#1}{%
				\parbox{\paperwidth}{
					\leftskip=\inset\rightskip=\inset
					\strut
					\vspace{-.16in} \\
					\textcolor{white}{#2}
					\vspace{.1in}
				}
			}
		}
	}
}
}

\newcommand\BottomBar[2]{%
	\AddEverypageHook{
		\smash{
			\hspace*{
				\ifmultipage
					\dimexpr-\PageLeftMargin-0.4in
				\else
					\dimexpr-\PageLeftMargin-0.48in
				\fi
			}%
			\raisebox{
				\ifmultipage
					\dimexpr\PageTopMargin-10.75in\relax
				\else
					\dimexpr\PageTopMargin-11.2in\relax
				\fi
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
	\noindent
	\underline{\smash{#1}}\vspace{0.2em}\\%
	{\bf #2} -- #3%
	#4%
}

\newcommand\DiplomaEntry[6]{% dates, diploma, extras+GPA, institution, location, description
	\noindent
	\underline{\smash{#1}}\vspace{0.2em}\\%
	{\bf #2}#3\\%
	{\bf #4} -- #5\\%
	#6
}

\newcommand\SimpleDiplomaEntry[4]{% dates, diploma, extras+GPA, institution, location, description
	\noindent
	\underline{\smash{#1}}\vspace{0.2em}\\%
	{\bf #2}\\%
	{\bf #3} -- #4%
}

\newcommand\SkillEntry[2]{%
	\underline{\smash{#1}}\vspace{1.5pt}\\%
	#2\vspace{1pt}\\%
}

\newcommand\BibEntry[2]{
	[#1]\hspace*{.8mm}%
	#2
}

\newcommand\EntrySpacing{\vspace{2.5pt}}

\newcommand\EmailLink[1]{
	\href{mailto:#1}{#1}
}

% ----------------------- Header bar -------------------------
\newcommand\HeaderBar[6] {% Name + title, description, phone, email
\smash{
	\hspace*{
		\dimexpr-\PageLeftMargin-0.112in
	}%
	\raisebox{
		\dimexpr\PageTopMargin-.64in\relax
	}{
		\colorbox{color1}{%
			\parbox{\paperwidth}{%
				\leftskip=\inset\rightskip=\inset%
				\vspace{0.75in}%
				\strut%
				% ----------- Here is the name and personal info -------------	
				\begin{minipage}[t]{.6\dimexpr\paperwidth-\inset}
					\ifmultipage
						\textcolor{white}{%
							{\LARGE{#1}}
							\vspace{0.05in}\\%
							{#2}
						}
					\else
						\textcolor{white}{%
							{\huge\textbf{#1}}
							\vspace{0.05in}\\%
							{\large #2}
						}
					\fi
				\end{minipage}%
				\hspace{.032\dimexpr\paperwidth-\inset}%
				\begin{minipage}[t]{.028\dimexpr\paperwidth-\inset}
					\ifmultipage
						\vspace{0.102in}
						\raisebox{-.05\height}{
							\href{#4}{\includesvg[width=8.5pt]{linkedin}}
						}
						\\
						\raisebox{-.15\height}{
							\href{#3}{\includesvg[width=8.5pt]{website}}
						}
					\else
						\vspace{0.075in}
						\raisebox{-.05\height}{
							\href{#4}{\includesvg[width=8.5pt]{linkedin}}
						}
						\\
						\raisebox{-.25\height}{
							\href{#3}{\includesvg[width=8.5pt]{website}}
						}
					\fi
				\end{minipage}
				\begin{minipage}[t]{.32\dimexpr\paperwidth-\inset}
					\ifmultipage
						\vspace{0.102in}
						{
							\textcolor{white}{
								\raisebox{-.2\height}{
									\includesvg[width=10pt]{smartphone}
								}\hspace*{-2mm}
								#5\\
								\raisebox{-.2\height}{
									\includesvg[width=10pt]{mail}
								}\hspace*{-2mm}
								\EmailLink{#6}
							}
						}
					\else
						\vspace{0.085in}
						{\large
							\textcolor{white}{
								\raisebox{-.2\height}{
									\includesvg[width=10pt]{smartphone}
								}\hspace*{-2mm}
								#5\\
								\raisebox{-.2\height}{
									\includesvg[width=10pt]{mail}
								}\hspace*{-2mm}
								\EmailLink{#6}
							}
						}
					\fi
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

\TopBar{color1}{}
%\BottomBar{color1}{Maybe some text}
\BottomBar{color1}{}
