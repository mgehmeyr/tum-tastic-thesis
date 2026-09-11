// =============================================================================
// preamble.typ -- global imports, settings and show rules for the whole thesis.
//
// This is the single place where packages, the glossary and your own styling
// live. `main.typ` and every chapter file import it, so a chapter looks the
// same whether it is compiled on its own or as part of the thesis.
//
// A chapter file starts with
//
//     #import "preamble.typ": *
//     #show: standalone
//
// then defines `#let content = [ ... ]` and ends with `#content`, so that
//
//     typst compile introduction.typ
//
// produces a self-contained PDF -- own page numbering, indices, bibliography
// and glossary -- while `main.typ` only imports the module and uses
// `.content`, ignoring everything the `#show` rule above did.
//
// `main.typ` applies `thesis-styles` and `use-glossary` instead of
// `standalone`, since it brings its own `dissertation` (or `thesis`) template.
//
// If you keep your chapters in a subfolder, import this file relatively
// (`#import "../preamble.typ": *`) and compile with `--root .` from the folder
// holding `main.typ`. Prefer that over a root-absolute `"/preamble.typ"`: the
// relative path also resolves when the editor's project root sits above your
// thesis folder.
// =============================================================================

#import "packages.typ": package

// ---------------------------------------------------------------- packages --
// Everything imported here is re-exported, so a file doing
// `#import "preamble.typ": *` gets all of it and no chapter has to maintain
// its own import list. Add packages you use across chapters here.

#import package("tum-tastic-thesis"): (
  algorithm,
  chapter,
  d,
  dissertation,
  flex-caption,
  i,
  listing,
  thesis,
  tum-tower-image,
)

#import package("glossarium"): (
  Gls,
  Glspl,
  gls,
  gls-long,
  gls-longplural,
  glspl,
  make-glossary,
  print-glossary,
  register-glossary,
)

#import package("dashy-todo"): todo

// ------------------------------------------------------- project resources --
// Your own helpers belong here too, e.g. a `definitions.typ` holding math
// operators you use throughout the thesis:
//
//     #import "definitions.typ": *

#import "glossary.typ": glossary

/// Bibliography used by the thesis and by every standalone chapter. The path
/// is resolved relative to the file that *uses* it, i.e. `preamble.typ` and
/// `main.typ`, which both sit next to the .bib file.
#let bib-file = "bibliography.bib"

// ------------------------------------------------------------ shared style --

/// Styling that must be identical in the thesis and in a standalone chapter.
/// Anything you want to look the same everywhere goes here, for example:
///
///     set text(font: "New Computer Modern")
///     show figure.where(kind: table): set figure.caption(position: top)
#let thesis-styles(body) = {
  body
}

/// Initializes glossarium and registers the entries of `glossary.typ`.
#let use-glossary(heading-always-first: false, body) = {
  show: make-glossary.with(heading-always-first: heading-always-first)
  register-glossary(glossary)
  body
}

/// Renders a reference that cannot be resolved as a red `(??)` instead of
/// failing the compilation. This is what lets a reference to a label in
/// another chapter survive when a single chapter is compiled on its own. See:
///  - https://github.com/typst/typst/issues/4524#issuecomment-2221803060
///  - https://github.com/typst/typst/issues/1276#issuecomment-1560091418
#let tolerate-missing-refs(body) = {
  show ref: it => {
    if it.element == none {
      text(fill: red)[(??)]
    } else {
      it
    }
  }

  body
}

// ------------------------------------------------------ standalone chapter --

/// Template for a chapter that can also be compiled on its own.
///
/// It bundles everything a chapter needs, so a chapter file no longer starts
/// with a block of boilerplate copied from its neighbours.
///
/// Citations work in standalone mode because the chapter appends its own
/// bibliography; set `bibliography: false` (and `glossary-list: false`) if you
/// would rather not have that back matter.
#let standalone(
  show-index: true,
  show-figures-index: true,
  show-table-index: true,
  show-listing-index: true,
  show-algorithm-index: true,
  bibliography: true,
  glossary-list: true,
  body,
) = {
  show: thesis-styles
  show: use-glossary
  show: tolerate-missing-refs

  show: chapter.with(
    show-index: show-index,
    show-figures-index: show-figures-index,
    show-table-index: show-table-index,
    show-listing-index: show-listing-index,
    show-algorithm-index: show-algorithm-index,
  )

  body

  // --- Back matter, printed only in standalone mode ---
  set heading(numbering: none)

  if bibliography {
    set page(header: [
      #set text(style: "italic")
      #align(right)[Bibliography]
    ])

    pagebreak()
    // `std` is needed because the parameter above shadows the built-in.
    std.bibliography(bib-file)
  }

  if glossary-list {
    set page(header: [
      #set text(style: "italic")
      #align(right)[Abbreviations]
    ])

    pagebreak()
    heading(level: 1)[Glossary]

    print-glossary(
      glossary,
      disable-back-references: true,
      user-print-group-heading: (group, level: none) => [],
    )
  }
}
