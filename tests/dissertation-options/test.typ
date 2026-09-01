#import "/src/tum-tastic-thesis.typ": dissertation

#import "@preview/algo:0.3.6" as algo

#let show-cover = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-cover-with-image = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    cover-image: rect(fill: blue),
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-abstract = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: [Here is my custom abstract],
  )
]

#let show-acknowledgements = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: [Here are my custom acknowledgements],
    abstract: none,
  )
]

#let show-zusammenfassung = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    zusammenfassung: [Here is my custom Zusammenfassung],
    abstract: none,
  )
]

#let show-glossary = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
    glossary: [Here is my custom Glossary],
  )
]

// Covers: headings nested inside a front-matter section's body (e.g. a
// Glossary's term-group headings) get the same h2/h3/h4 sizing as
// headings in the main body, instead of falling back to Typst's
// defaults.
#let show-glossary-with-nested-headings = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
    glossary: [
      == A level-2 heading
      === A level-3 heading
      ==== A level-4 heading
    ],
  )
]

// Covers: acknowledgements -> zusammenfassung -> abstract -> glossary ->
// contents order; figures/tables indexes printed as front matter (before
// the body); and that disabled indexes (listing, algorithm) are not
// emitted.
#let show-front-matter-order = [
  #show: dissertation.with(
    show-index: true,
    show-algorithm-index: false,
    show-figures-index: true,
    show-cover: false,
    show-table-index: true,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: [Here are my custom acknowledgements],
    zusammenfassung: [Here is my custom Zusammenfassung],
    abstract: [Here is my custom abstract],
    glossary: [Here is my custom Glossary],
  )

  = Body
  #figure(rect(), caption: [A figure in the body])
  #figure(table(columns: 1)[Cell], caption: [A table in the body])
]

// Covers: section-order lets callers pick an arbitrary order, including
// putting the Table of Contents before other front-matter sections
// (which still lists them correctly regardless of placement).
#let show-custom-front-matter-order = [
  #show: dissertation.with(
    show-index: true,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    zusammenfassung: [Here is my custom Zusammenfassung],
    abstract: [Here is my custom abstract],
    glossary: [Here is my custom Glossary],
    section-order: ("index", "glossary", "abstract", "zusammenfassung", "body"),
  )

  = Body
]

// Covers: "body" can be moved earlier in section-order so indexes print
// after the body instead of before it (the pre-front-matter-reorder
// behavior), and that the body-to-index transition still starts on a
// fresh page instead of sharing a page with the tail of the last chapter.
#let show-index-after-body = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: true,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    zusammenfassung: none,
    abstract: none,
    glossary: none,
    section-order: ("body", "figures-index"),
  )

  = Body
  #figure(rect(), caption: [A figure in the body])
]

// Covers: heading-sizes overrides apply uniformly to chapter headings,
// front-matter titles, nested front-matter headings, and ToC/index
// titles -- all read from the same merged dict.
#let show-custom-heading-sizes = [
  #show: dissertation.with(
    show-index: true,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    zusammenfassung: none,
    abstract: [Here is my custom abstract],
    glossary: [
      == A group heading
      An entry
    ],
    heading-sizes: (h1: 30pt, h2: 9pt),
  )

  = Chapter One
  == A subsection
]

#let show-index = [
  #show: dissertation.with(
    show-index: true,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Figures
]

#let show-algorithm-index = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: true,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Algorithms
]

#let show-figures-index = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: true,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Figures
]

#let show-table-index = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: true,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Tables
]

#let show-listing-index = [
  #show: dissertation.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: true,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Listing
]

#let show-custom-title = [
  #show: dissertation.with(
    title: [Custom title],
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-subtitle = [
  #show: dissertation.with(
    subtitle: [Custom subtitle],
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-author-info = [
  #show: dissertation.with(
    author-info: (
      name: "Custom Name",
      group-name: "Custom Group Name",
      school-name: "Custom School Name",
    ),
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-chair-info = [
  #show: dissertation.with(
    committee-info: (
      chair: "Custom Prof. Chair",
      first-evaluator: "Custom first evaluator",
      second-evaluator: "Custom second evaluator",
    ),
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-dates = [
  #show: dissertation.with(
    date-submitted: datetime(
      year: 1800,
      month: 10,
      day: 4,
    ),
    date-accepted: datetime(
      year: 1900,
      month: 10,
      day: 4,
    ),
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-degree-name = [
  #show: dissertation.with(
    degree-name: "My Custom Degree",
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-chapter-header = [
  #show: dissertation.with(
    degree-name: "My Custom Degree",
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: true,
    acknowledgements: none,
    abstract: none,
  )
  = One
  #pagebreak()
  == Inside one
  #pagebreak()
  = Two
  #pagebreak()
  == Inside two
]

#show-cover
#show-cover-with-image
#show-index
#show-abstract
#show-acknowledgements
#show-zusammenfassung
#show-glossary
#show-glossary-with-nested-headings
#show-front-matter-order
#show-custom-front-matter-order
#show-index-after-body
#show-custom-heading-sizes
#show-algorithm-index
#show-figures-index
#show-table-index
#show-listing-index
#show-custom-title
#show-custom-subtitle
#show-custom-author-info
#show-custom-chair-info
#show-custom-dates
#show-chapter-header
