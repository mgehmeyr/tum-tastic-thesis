// Packages, the glossary and the global styling come from preamble.typ, which
// main.typ uses as well. `standalone` adds everything this file needs to
// compile into its own PDF: indices, a bibliography and a glossary.
#import "preamble.typ": *
#show: standalone

// Only here to generate random paragraphs of text
#let insert-par(num-par) = {
  while num-par > 0 {
    par()[#lorem(120)]
    num-par = num-par - 1
  }
}

#let content = [
  = Theory <ch:theory>
  Check references style: @ch:theory, @theory:sec:first and @theory:sec:second.
  Also @theory:subsec:first and @theory:subsec:second. The bibliography also
  works when compiling a standalone chapter: @knuth1990literate
  @lamport1994latex. @pde was already referenced in the introduction, so
  it appears here in its short form.

  #todo[Add a citation for this claim.]

  #insert-par(3)

  == First subsection theory <theory:sec:first>
  #insert-par(4)

  === A subsubsection <theory:subsec:first>
  #insert-par(4)

  === Another subsubsection <theory:subsec:second>
  #insert-par(2)

  == A figure <theory:sec:second>

  === With normal caption
  #figure(
    ellipse(width: 35%, height: 50pt),
    caption: [Just an ellipse],
  )

  === With flex-caption
  Our flex-caption is based on #link(
    "https://github.com/typst/typst/issues/1295#issuecomment-2749005636",
  )[the solution proposed by q-wertz].

  // See: https://github.com/typst/typst/issues/1295#issuecomment-2749005636
  #figure(
    curve(
      fill: blue.lighten(80%),
      stroke: blue,
      curve.move((0pt, 50pt)),
      curve.line((100pt, 50pt)),
      curve.cubic(none, (90pt, 0pt), (50pt, 0pt)),
      curve.close(),
    ),
    caption: flex-caption(
      short: [Short caption for outline],
      long: [This is a really long caption, so a brief version should be
        displayed in the *List of Figures*. You can use it for anything that
        takes a caption],
    ),
  )

  == A table

  #figure(
    table(columns: 2)[A][B][C][D],
    caption: [Amazing table],
  )

  == Code snippet

  #listing(
    my-code: ```typst
    #show ref: it => {
      if it.element == none {
        text(fill: red)[(??)]
      } else {
        it
      }
    }
    ```,
    caption: [Code snippet using listing function],
  )

  == An algorithm

  #algorithm(
    title: "Fib",
    parameters: ("n",),
    my-content: [
      if $n < 0$:#i\ // use #i to indent the following lines
      return null#d\ // use #d to dedent the following lines
      if $n = 0$ or $n = 1$:#i \
      return $n$#d \
      return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
    ],
    caption: [My algorithm],
  )

]

#content
