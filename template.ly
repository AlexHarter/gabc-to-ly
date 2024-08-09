\version "2.25.16"

\header {
  % ly_metadata
}

oriscus = {
  \once \override NoteHead.stencil = #ly:text-interface::print
  \once \override NoteHead.text = \markup \musicglyph "noteheads.ssolesmes.oriscus"
}

quilisma = {
  \once \override NoteHead.stencil = #ly:text-interface::print
  \once \override NoteHead.text = \markup \musicglyph "noteheads.svaticana.quilisma"
}

liquescentDiminutive = {

}

liquescentAugmentativeAscending = {

}

liquescentAugmentativeDescending = {

}

global = {
  \candenzaOn
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
% template generated from Org-Mode on <%DATE>
% score generated from https://github.com/AlexHarter/gabc-to-ly
