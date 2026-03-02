require("prosa_settings")

-- latex snippets
local opts = {buffer = 0}

-- General snippets

vim.snippet.add(
    "\\b",
[=[
\begin{$1}
  $2
\end{$1}
]=],
    opts
)

vim.snippet.add(
    "pic",
[=[
\begin{figure}[ht!]
  \centering
  \includegraphics[width=\textwidth]{./$1}
  \label{$2}
  \caption{$3}
\end{figure}
]=],
    opts
)

vim.snippet.add(
   "tab",
[=[
\begin{table}[ht!]
  \begin{center}
    \begin{tabular}{$1}
      $2
      \hline
      $3
    \end{tabular} 
  \end{center}
\end{table}
]=],
    opts
)

vim.snippet.add(
   "code",
[=[
\begin{verbatim}
\end{verbatim}
]=],
    opts
)

vim.snippet.add(
   "```",
[=[
\begin{verbatim}
\end{verbatim}
]=],
    opts
)

vim.snippet.add(
    "codeinc",
[=[
\lstinputlisting[language=$1]{./$2}
]=],
    opts
)

-- text formatting snippets

vim.snippet.add( 
    "**",
[=[
\textbf{$1}
]=],
    opts
)

vim.snippet.add(
    "*",
[=[
\textit{$1}
]=],
    opts
)

vim.snippet.add(
    "href",
[=[
\href{$1}{$2}
]=],
    opts
)

vim.snippet.add(
    "-",
[=[
\begin{itemize}
  \item $1 
\end{itemize}
]=],
    opts
)

vim.snippet.add(
    "1.",
[=[
\begin{enumerate}
  \item $1 
\end{enumerate}
]=],
    opts
)

vim.snippet.add(
    "desc",
[=[
\begin{description}
  \item [$1]
    $2
\end{description}
]=],
    opts
)

-- headings

vim.snippet.add(
    "#",
[=[
\section{$1}
]=],
    opts
)

vim.snippet.add(
    "##",
[=[
\subsection{$1}
]=],
    opts
)

vim.snippet.add(
    "###",
[=[
\subsubsection{$1}
]=],
    opts
)

-- math
--
vim.snippet.add(
    "=",
[=[
\begin{equation*}
  $1
\end{equation*}
]=],
    opts
)

vim.snippet.add(
    "&=",
[=[
\begin{align*}
  $1
\end{align*}
]=],
    opts
)

vim.snippet.add(
    "mat",
[=[
\begin{matrix}
    ${1: c & c & \}
\end{matrix}
]=],
    opts
)

vim.snippet.add(
    "\\f",
[=[
\frac{ $1 }{ $2 }
]=],
    opts
)

vim.snippet.add(
    "qty",
[=[
\qty{ $1 }{ $2 }
]=],
    opts
)

-- figures and graphics
vim.snippet.add(
    "plot",
[=[
\begin{tikzpicture}[domain=0:10]
  \draw[step=0.5, very thin, gray!25] (0, -1) grid (10, 1);
  \draw[->] (0, -1) -- (0,1) node[right]{$y$};
  \draw[->] (0, 0) -- (10,0) node[below]{$x$};

  \draw plot (\x,{sin(\x r)});
\end{tikzpicture}
]=],
    opts
)

vim.snippet.add(
    "coord",
[=[
\begin{tikzpicture}[domain=-5:5]
  \draw[step=0.5, very thin, gray!25] (-5, -5) grid (5, 5);
  \draw[->] (0, -5) -- (0,5) node[right]{$y$};
  \draw[->] (-5, 0) -- (5,0) node[below]{$x$};
\end{tikzpicture}
]=],
    opts
)

-- circuits
--
vim.snippet.add(
    "packcircuit",
[=[
    \usepackage[european,straightvoltages]{circuitikz}
]=],
    opts
)

vim.snippet.add(
    "circuit",
[=[
\begin{figure}[ht!]
  \center
  \begin{circuitikz}
    \draw(0,0)
      to[V<=$$U_q$] (0,2)
      to[short] (2,2)
      to[R=$$R_A$,v=$$U_R$] (2,0)
      to[short] (0,0);

    \draw(2,2)
      to[short,*-o] (3,2);
    \draw(2,0)
      to[short,*-o] (3,0);

    \draw(3,2)
      to [open, v^=$U_A$] (3,0);
  \end{circuitikz}
  \label{$1}
  \caption{$2}
\end{figure}
]=],
    opts
)
