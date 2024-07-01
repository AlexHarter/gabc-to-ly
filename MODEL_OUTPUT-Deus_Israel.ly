\version "2.24.3"
\include "gregorian.ly"

\header {
  title = "Deus Israel"
}

global = {
  \cadenzaOn
  \omit Staff.TimeSignature
  \key c \major
}

melody = \relative c'' {
  \global
  g8([ c]) c([ c] c4) a a( \acciaccatura b16 c4 d8[ c] \acciaccatura d16 c4) c( b) \divisioMinor
}

text = \lyricmode {
  DE -- us Is -- ra -- el
}

\score {
  <<
  \new Staff {
    \context Voice = "vocal" { \melody }
  }
  \new Lyrics \lyricsto "vocal" \text
  >>
}
% tangled from Org-Mode on <%DATE>
% generated from https://github.com/AlexHarter/gabc-to-ly
