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
  % quilisma
  a4 
  \once \override NoteHead.stencil = #(lambda (grob) (grob-interpret-markup grob #{ \markup \musicglyph #"gregorian.gquilisma" #})) 
  b16 
  c4 
  \divisioMinima
  
  % oriscus
  d8[ c] 
  %\once \override NoteHead.stencil = #(lambda (grob) (grob-interpret-markup grob #{ \markup \musicglyph #"neomensural.u1D1DA" #})) 
  \oriscus c4 
  \finalis \break
  
}

\score {
  <<
  \new Staff {
    \context Voice = "vocal" { \melody }
  }
  >>
}
% generated from https://github.com/AlexHarter/gabc-to-ly
