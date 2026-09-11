// Packages, the glossary and your global styling all live in preamble.typ,
// which every chapter imports as well. That way a chapter compiled on its own
// looks exactly like it does here.
#import "preamble.typ": *

#show: thesis-styles
#show: use-glossary

// Import each chapter here
#import "theory.typ" as theory
#import "introduction.typ" as introduction

// We configure the template. Check more parameters in the template
// documentation: https://typst.app/universe/package/tum-tastic-thesis
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
  zusammenfassung: [#lorem(100)],
  abstract: [#lorem(100)],
  glossary: print-glossary(
    glossary,
    disable-back-references: true,
    group-heading-level: 3,
  ),
  cover-image: tum-tower-image(),
)

// If you are doing a bachelor/master thesis, use instead the code below.
// Check more parameters in the template documentation:
// https://typst.app/universe/package/tum-tastic-thesis
//
// Note: `zusammenfassung` and `glossary` are dissertation-only arguments.
//
// #show: thesis.with(
//   author-info: (
//     name: "Your Name Here",
//     group-name: "Your Group Or Chair Here",
//     school-name: "Your School Here",
//   ),
//   title: [Your Title Here],
//   subtitle: none,
//   degree-name: "Bachelor in Science",
//   committee-info: (
//     examiner: "Prof. Chair Here",
//     supervisor: "Supervisor goes here",
//   ),
//   date-submitted: datetime(
//     year: 2020,
//     month: 10,
//     day: 4,
//   ),
//   acknowledgements: [#lorem(100)],
//   abstract: [#lorem(100)],
//   cover-image: tum-tower-image(),
// )

// Your chapters go here
#introduction.content

#pagebreak()
#theory.content

// After your chapters:

#set heading(numbering: none)

// Print bibliography
#set page(header: [
  #set text(style: "italic")
  #align(right)[Bibliography]
])

#pagebreak()
#bibliography(bib-file)
