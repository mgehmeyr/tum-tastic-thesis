#import "utils.typ": print-section-before-chapters

#let print-glossary-page(body) = [
  #print-section-before-chapters(title: "Glossary", body)
]

#let body = [
  #lorem(120)

  #lorem(200)
]

#print-glossary-page(body)
