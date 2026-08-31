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
#show-front-matter-order
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
