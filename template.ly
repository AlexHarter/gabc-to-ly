\version "2.24.3"
\include "gregorian.ly"

\header {
  % ly_metadata
}

global = {
  \candenzaOn
  \omit Staff.TimeSignature
  \key c \major
}

melody = \relative c'' {
  \global

  % ly_melody


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
% generated from https://github.com/AlexHarter/gabc-to-ly
