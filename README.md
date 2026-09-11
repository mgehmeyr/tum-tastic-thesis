# *TUM-tastic* thesis template

<p align="center">
  <a href="https://github.com/fuchs-fabian/typst-template-aio-studi-and-thesis/blob/main/LICENSE">
    <img alt="MIT License" src="https://img.shields.io/badge/license-MIT-brightgreen">
  </a>
</p>

This is an **unofficial** typst template for TUM thesis and dissertations. It
includes also a specific template to compile each Chapter as a standalone
document, which can be pretty helpful for longer documents.

We designed it to have sane defaults, while being customizable. For example, by
default it does:

- Numbering based on chapters (e.g., `Figure 2.3` for the third figure in the second Chapter).
- Formatting of the outline.
- Labeling of reference to sections according to level (i.e., a `@ref:heading:level:1` results in reference `Chapter X`, while a `@ref:heading:level:2` results in `Section X.Y`, where `X` is the Chapter number).
- Many other minor things.

## Getting started

It is as simple as executing:

```bash
typst init @preview/tum-tastic-thesis
```

Alternatively, if you want to modify the template itself, take a look at
[the repository](https://github.com/santiagonar1/tum-tastic-thesis).

## Usage

*TUM-tastic* comes with three different templates:

1. The `dissertation` template, used for the TUM dissertation.
1. The `thesis` template, used for the TUM thesis.
1. The `chapter` template, used to format standalone chapters.

It also comes with three helper functions:

1. `flex-caption`, useful to distinguish between shorter and longer captions, to show in the outline or below the element, respectively. It is based on [this code snippet](https://github.com/typst/typst/issues/1295#issuecomment-2749005636).
1. `listing`, uses the `code` function from [algo](https://typst.app/universe/package/algo/), but handling captions. You can use labels with our `listing`, as you would do with a figure.
1. `algorithm`, that creates an abstraction on top of the [algo](https://typst.app/universe/package/algo/). It maintains consistency in style and handles the caption (e.g., it uses `Algorithm` as a supplement in the caption). You can use labels with our `algorithm`, as you would do with a figure.

We also expose:

1. `font-sizes`, a dictionary with the font size for base and h[1-4].
1. `tum-colors`, a dictionary with different colors taken from the TUM corporate design.

### Dissertation

The default parameters of the `dissertation` template are listed below. As you
can see, there are multiple points of customization, especially on what elements
should be printed or not (e.g., the cover, different outlines).

```typst
#import "@preview/tum-tastic-thesis:0.1.1": dissertation

#show: dissertation.with(
  author-info: (
    name: "Your Name Here",
    group-name: "Your Group Or Chair Here",
    school-name: "Your School Here",
  ),
  title: [Your Title Here],
  subtitle: none,
  degree-name: "Dr. In Something",
  committee-info: (
    chair: "Prof. Chair Here",
    first-evaluator: "Prof. First Evaluator Here",
    second-evaluator: "Prof. Second Evaluator Here",
  ),
  date-submitted: datetime(
    year: 2020,
    month: 10,
    day: 4,
  ),
  date-accepted: datetime(
    year: 2021,
    month: 10,
    day: 4,
  ),
  acknowledgements: [#lorem(100)],
  abstract: [#lorem(100)],
  show-cover: true,
  cover-image: none,
  show-index: true,
  show-figures-index: true,
  show-table-index: true,
  show-listing-index: true,
  show-algorithm-index: true,
  show-chapter-header: true,
)
```

### Thesis

The default parameters of the `thesis` template are listed below. It is pretty
similar to the `dissertation` one, but with fewer fields. The title page of
a thesis and a dissertation also differs, but *TUM-tastic* takes care of that.

```typst
#import "@preview/tum-tastic-thesis:0.1.1": thesis

#show: thesis.with(
  author-info: (
    name: "Your Name Here",
    group-name: "Your Group Or Chair Here",
    school-name: "Your School Here",
  ),
  title: [Your Title Here],
  subtitle: none,
  degree-name: "Bachelor in Science",
  committee-info: (
    examiner: "Prof. Chair Here",
    supervisor: "Supervisor goes here",
  ),
  date-submitted: datetime(
    year: 2020,
    month: 10,
    day: 4,
  ),
  acknowledgements: [#lorem(100)],
  abstract: [#lorem(100)],
  show-cover: true,
  cover-image: none,
  show-index: true,
  show-figures-index: true,
  show-table-index: true,
  show-listing-index: true,
  show-algorithm-index: true,
  show-chapter-header: true,
)
```

### Standalone chapter

You can, of course, write all your thesis/dissertation on the same `*.typ` file.
If you do that, you simply need to enable either a `dissertation`
or `thesis` template. Nonetheless, this approach might prove messy,
especially for long documents. That is why we include the `chapter` template,
with the default values shown below.

```typst
#import "@preview/tum-tastic-thesis:0.1.1": chapter

#show: chapter.with(
  show-index: false,
  show-figures-index: false,
  show-table-index: false,
  show-listing-index: false,
  show-algorithm-index: false,
  show-chapter-header: true,
)
```

Every chapter needs the same setup: the packages it uses, the glossary, your
own styling, and the handling of references that only resolve in the full
document. Rather than pasting that block into each chapter, the shipped
template puts it in a single `preamble.typ` that `main.typ` and every chapter
import. A chapter then begins with two lines, and the settings can only ever
be changed in one place.

```typst
// ------ preamble.typ -----
#import "@preview/tum-tastic-thesis:0.1.1": chapter, dissertation

// Re-exported: a file doing `#import "preamble.typ": *` gets all of this.
#import "glossary.typ": glossary

/// Styling that must look the same in the thesis and in a standalone chapter.
#let thesis-styles(body) = {
  // e.g. set text(font: "New Computer Modern")
  body
}

/// A chapter that can also be compiled on its own.
#let standalone(body) = {
  show: thesis-styles

  // Handle undefined references when compiling a chapter as a standalone
  // document. See:
  //  - https://github.com/typst/typst/issues/4524#issuecomment-2221803060
  //  - https://github.com/typst/typst/issues/1276#issuecomment-1560091418
  show ref: it => {
    if it.element == none { text(fill: red)[(??)] } else { it }
  }

  show: chapter.with(/* configure to your needs */)

  body

  // Back matter, reached only in standalone mode.
  set heading(numbering: none)
  pagebreak()
  std.bibliography("bibliography.bib")
}
```

Your `main.typ` then looks something like:

```typst
// ----- main.typ ------
#import "preamble.typ": *

#show: thesis-styles

#import "introduction.typ" as introduction

#show: dissertation.with(/* configure for your needs */)

// We bring the content of the chapter
#introduction.content

// The full document needs its own bibliography; `standalone` adds one only
// to the chapter's own PDF.
#pagebreak()
#bibliography("bibliography.bib")
```

And an `introduction.typ` like:

```typst
// ------ introduction.typ -----
#import "preamble.typ": *
#show: standalone

#let content = [
    // Put the chapter's content here 
]

#content
```

`main.typ` only imports the module and uses `.content`, so the `#show:
standalone` rule and the trailing `#content` are ignored there -- they are what
makes the file compile on its own. You can now compile the introduction as a
standalone document! 🎉

A few things worth knowing:

1. The bibliography works in standalone mode as long as the chapter appends one itself, as `standalone` does above. Without it, citations render as `??` in the chapter's own PDF while still resolving correctly in `main.typ`.
1. A reference to a label defined in *another* chapter cannot resolve in standalone mode. That is what the `show ref` rule above is for: it renders those as a red `(??)` instead of failing the compilation.

If you decide to store your chapters in a separate folder (e.g., `chapters`),
import the preamble relatively (`#import "../preamble.typ": *`) and compile
from the root folder (i.e., where your `main.typ` is located) with:

```sh
typst compile chapters/introduction.typ --root .
```

The `--root` flag is needed because Typst otherwise treats the chapter's own
folder as the project root and refuses to look above it. Prefer the relative
`"../preamble.typ"` over a root-absolute `"/preamble.typ"`: the relative path
also resolves when your editor's project root sits above the thesis folder.

### Using `flex-caption`

You can use `flex-caption` with anything that takes a caption, such a figure,
listing, algorithm, etc.

```typst
#import "@preview/tum-tastic-thesis:0.1.1": flex-caption

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
```

### Using `listing`

```typst
#import "@preview/tum-tastic-thesis:0.1.1": listing

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
    fill: luma(240), // Default value
    caption: [Code snippet using listing function],
  )
```

We offer this purely for convenience. You can also pass a `code` to a figure,
in case you want more control on the styling. Just make sure to pass
`kind: raw` as the figure type, so that the template handles the listing
numbering appropriately.

```typst
#import "@preview/algo:0.3.6": code

#let my-code = ```typst
    #show ref: it => {
      if it.element == none {
        text(fill: red)[(??)]
      } else {
        it
      }
    }
    ```
// Here you can use all the styling offered by the code function in the
// algo package. Mark the kind of figure as raw!
#figure(code(my-code, fill: luma(240)), caption: [my caption], kind: raw)
```

### Using `algorithm`

We have a wrapper on top of the [algo](https://typst.app/universe/package/algo/)
package. We did so such that we could guarantee a consistent style, as well
as generate a List of Algorithms. Be aware that, as of now, we do not expose
all the [algo](https://typst.app/universe/package/algo/) package, but simply
`d` and `i` (i.e., you cannot get things like `code`, or `comment` from
*TUM-tastic*).

```typst
#import "@preview/tum-tastic-thesis:0.1.1": algorithm, d, i

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
    fill: rgb(255, 244, 204), // Default value
  )
```

As with `listing`, you can also recreate this by passing an `algo` to a `figure`.
This has the advantage that you can have additional styling options. Make sure
to mark `kind: "algorithm"` for the `figure` , and add as supplement
`[Algorithm]`, so that the template includes it in the Algorithm section and
puts the correct caption:

```typst
#import "@preview/algo:0.3.6": algo, i, d

#let my-content = [
  if $n < 0$:#i\ // use #i to indent the following lines
  return null#d\ // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i \
  return $n$#d \
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
]

// Here you can use all the styling offered by the algo function in the
// algo package. Mark the kind of figure as "algorithm", and add as supplement
// `[Algorithm]`
#figure(
  algo(
    title: "Fib",
    parameters: ("n",),
    fill: rgb("#e4c554"),
    my-content,
  ),
  caption: [my caption],
  kind: "algorithm",
  supplement: [Algorithm],
)
```

## Contributing

All the help is welcomed! If you choose to do so, simply go to my
[github repository](https://github.com/santiagonar1/tum-tastic-thesis) 😉.
