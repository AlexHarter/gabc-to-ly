\version "2.24.3"
\include "gregorian.ly"
%TODO incorporate oriscus and virga onto modern staff

global = {
  \cadenzaOn
  \omit Staff.TimeSignature
  \key c \major
}

melody = \relative c'' {
  \global
  % ly_melody
}

text = \lyricmode {
  % ly_lyrics
}

\score {
  <<
  \new Staff {
    \context Voice = "vocal" { \melody }
  }
  \new Lyrics \lyricsto "vocal" \text
  >>
}