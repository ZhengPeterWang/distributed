% Author: Yang Liu
% Email: blueloveTH@foxmail.com
% License: LaTeX Project Public License v1.3c

\ProvidesClass{cucthesis}[2021/02/23 v0.1 Thesis Class of Communication University of China]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=CUC, prefix=CUC@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{CUC}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% 设置纸张格式
\RequirePackage[
  a4paper,
  left=3cm,right=2.3cm,top=2.3cm,bottom=2.6cm,
  headheight=10cm,
  headsep=0.3cm]{geometry}
\setlength{\headsep}{0.6cm}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo}

% 设置目录与引用的超链接（需要编译多次）
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times New Roman}

% 1.25倍行距
\linespread{1.25}

% 段落缩进2字符
\setlength\parindent{2\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\zihao{5}}
\renewcommand\refname{参考文献}

\renewcommand\figurename{图}
\renewcommand\tablename{表}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace}
\captionsetup[figure]{skip=8pt,labelsep=onespace}

\renewcommand{\captionfont}{\songti\zihao{5}}

% 图表与公式编号
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

\newcommand{\appendixformat}{
  \renewcommand\figurename{附图}
  \renewcommand\tablename{附表}
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
}

%%%%%%%%%%%%%%%%%%%%%% code style %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    frame=single,
}

\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词 %%%%%%%%%%%%%%%%%%%%%%

% 中文摘要命令
\renewenvironment{abstract}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\heiti{摘~~~~要}

    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{摘~~~~要}
  \zihao{-4}\ignorespaces
}{\clearpage}

\newcommand{\keywords}[1]{\newline\newline\newline\noindent\heiti{关键词：}\heiti #1}

% 英文摘要命令
\newenvironment{abstractEN}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\heiti{前~~~~言}
    
    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{前~~~~言}
  \zihao{4}\ignorespaces
}{\clearpage}

\newcommand{\keywordsEN}[1]{\newline\newline\newline\noindent{Keywords: }#1}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{setspace,titlesec,zhnumber,titletoc}

\renewcommand{\thesection}{\zhnum{section}}
\renewcommand{\thesubsection}{\zhnum{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

\newcommand{\sectionbreak}{\clearpage}
\titleformat{\section}[block]{\vspace*{-10pt} \centering \zihao{3} \heiti}
{\thesection、}{0pt}{\vspace{8pt}}

\titleformat{\subsection}{\zihao{4} \heiti}
{（\thesubsection）}{0pt}{}

\titleformat{\subsubsection}{\zihao{-4} \heiti}
{\thesubsubsection.~~}{0pt}{}

%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%

\renewcommand\contentsname{\heiti \centering \zihao{3} 目~~~~录}

\titlecontents{section}[0pt]{\bfseries \songti \zihao{-4}}
{\thecontentslabel、}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[1\ccwd]{\songti \zihao{-4}}
{（\thecontentslabel）}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsubsection}[3\ccwd]{\songti \zihao{-4}}
{\thecontentslabel.~~}{}
{\titlerule*[0.7em]{.}\contentspage}


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{\clearpage\phantomsection\addcontentsline{toc}{section}{参考文献}}{\clearpage}


\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
}


\newcommand{\contentpage}{
  \begin{spacing}{1.5}
    \tableofcontents
  \end{spacing}

  \clearpage

  \chead{\zihao{5}\ziju{0.08}\fangsong{分布式系统}}
  \renewcommand{\headrulewidth}{1.0pt}
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\nonumsection}[1]{
  \clearpage\phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}



%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
}}

\newcommand{\infobox}[2]{
    \hspace{2.4cm}\songti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[8cm][c]{#2}}}}
}


\newcommand{\coverpage}{
  \begin{titlepage}
    \vspace*{-10pt}
  
    \noindent
  
    \vspace*{2\ccwd}
  
    \centering
    \zihao{0}\textbf{\songti{分\hphantom{空}布\hphantom{空}式\hphantom{空}系\hphantom{空}统}}
    \vspace{1.2cm}
  
    \vspace{5.5cm}
  
    \flushleft
  
    \centering
    \zihao{-2}\ziju{2}\textbf{\songti{汪铮}}
    \vspace{1cm}
    
    \centering
    \zihao{-2}\ziju{0.5}\textbf{\songti{康奈尔大学}}
  
    \zihao{-2}\ziju{0.5}\textbf{\songti{\zhtoday}}
  \end{titlepage}
  
  \pagestyle{CUCThesisMain}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}

