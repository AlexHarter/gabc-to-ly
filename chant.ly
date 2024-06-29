\version "2.24.3"
\include "gregorian.ly"

\header {
  % ly_metadata
}

global = {
  \cadenzaOn
  \omit Staff.TimeSignature
  \key c \major
}

melody = \relative c'' {
  \global
  g8c8c8c8c4a4a8a4b8c4d8c8c8e8e8c4b4
}

text = \lyricmode {
    -- D -- E -- u s   -- I -- s -- r -- a -- e l  *
}

\score {
  <<
  \new Staff {
    \context Voice = "vocal" { \melody }
  }
  \new Lyrics \lyricsto "vocal" \text
  >>
}
% tangle from Org-Mode on <2024-06-28>
