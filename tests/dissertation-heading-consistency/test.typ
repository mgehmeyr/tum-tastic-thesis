// Regression test: a caller can legitimately have its own document-wide
// heading show rule (e.g. to size headings by level) declared before
// `dissertation.with()` is invoked, wrapping everything it produces.
// Front-matter titles (Abstract, Zusammenfassung, Glossary,
// Acknowledgements) must not inherit that outer sizing -- they should
// keep the package's own font-sizes.h1, matching Contents/List of
// Figures/chapter headings.
#show heading: it => {
  let sizes = (16pt, 14pt, 12pt, 11pt)
  set text(size: sizes.at(it.level - 1, default: 11pt))
  it
}

#import "/src/tum-tastic-thesis.typ": dissertation

#show: dissertation.with(
  show-cover: false,
  show-chapter-header: false,
  acknowledgements: [Here are my custom acknowledgements],
  zusammenfassung: [Here is my custom Zusammenfassung],
  abstract: [Here is my custom abstract],
  glossary: [Here is my custom Glossary],
  show-index: true,
  show-figures-index: false,
  show-table-index: false,
  show-listing-index: false,
  show-algorithm-index: false,
)

= Chapter One
== A subsection
