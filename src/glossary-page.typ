#import "tum-font.typ": font-sizes
#import "utils.typ": print-section-before-chapters

#let print-glossary-page(body, sizes: font-sizes) = [
  #print-section-before-chapters(title: "Glossary", body, sizes: sizes)
]

#let body = [
  #lorem(120)

  #lorem(200)
]

#print-glossary-page(body)
