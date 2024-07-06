\version "2.24.3"

\header {
  title = "Deus Israel"
}

global = {
  \key c \major
  \cadenzaOn
  \omit Staff.TimeSignature
}

melody = \relative c'' {
  \global
  g8([ c]) c([ c] c4) a a( \slashedGrace{ \stemNeutral b16} c4 d8[ c] \slashedGrace{ \stemNeutral d16} c4) c( b) \bar "'"
  g8([ \tweak #'font-size #-3 a]) a([ c b c]) b([ \tweak #'font-size #-3 a]) a4 \bar "," \break
  g4 a g g8([ f] a4) a a( \slashedGrace{ \stemNeutral b16} c4 b4. a16[ g] a4) a( g2) \bar ","
  g8([ a] c[ b]) c4 c c8([ c] c4) a \bar "," \break
  a4 a a8([ f] a4) a4( b8[ a] g4) a8([ g]) g2 \bar ","
  g4 a8([ c]) b4( c8[ c] g4 a c8[ c] a4) a4( f \slashedGrace{ \stemNeutral g16} a8[ g] a4) a4( g) \bar "," \break
  g4 \slashedGrace g16( a4) a a( \slashedGrace{ \stemNeutral b16} c4) g g( a) \bar ","
  f4 f e8([ \slashedGrace{ \stemNeutral g16} f8] a4) a g( f a8[ g] f4 g) e2 \bar "||" \break
  
  e8([ \tweak #'font-size #-3 e]) f4 g8([ \tweak #'font-size #-3 f]) g4 \bar ","
  g8([ \tweak #'font-size #-3 f]) g4( e f \slashedGrace{ \stemNeutral g16} a4 g) g8([ a g a] f4 d \slashedGrace{ \stemNeutral e16} f4 g8[ \tweak #'font-size #-3 e]) e2 \bar "||" \break
  g4 a8([ b]) b4 b b c d c c b8([ a]) c([ c] c2) \bar ","
  a8([ g]) a([ \tweak #'font-size #-3 b]) b4 b c8([ c c b]) a([ g]) a4 b8([ \tweak #'font-size #-3 b]) \slashedGrace a16( g4 a2) \bar "||" \break
  
  g4 a8([ b]) b4 b b \bar "||"
  c4 d c c b8([ \tweak #'font-size #-3 a]) c([ c] c2) \bar "||"
  c4 d c b8([ \tweak #'font-size #-3 a]) c([ c] c2) \bar "||" \break
  b4 c8([ c c b]) a([ g]) a4 b \slashedGrace a16( g4 a2) \bar "||" \break
}

text = \lyricmode {
  DE -- us Is -- ra -- \markup {"el" *}
  con -- jún -- gat vos,
  et ip -- se sit vo -- bís -- cum,
  qui mi -- sér -- tus est
  du -- ó -- bus ú -- ni -- cis:
  et nunc, Dó -- mi -- ne,
  fac e -- os plé -- ni -- us
  be -- ne -- dí -- ce -- re te.
  \markup{ \italic T.P. "Al"} -- le -- lú -- ia,
  al -- le -- lú -- ia.
  
  Be -- á -- ti om -- nes qui ti -- ment Dó -- mi -- \markup{"num:" *}
  qui ám -- bu -- lant in vi -- is e -- jus.
  
  Gló -- ri -- a Pa -- tri...
  Spi -- rí -- tu -- i Sanc -- to...
  Et nunc, et sem -- per...
  E u o u a e.
}

\score {
  <<
  \new Staff {
    \context Voice = "vocal" { \melody }
  }
  \new Lyrics \lyricsto "vocal" \text
  >>
}
% generated from https://github.com/AlexHarter/gabc-to-ly
