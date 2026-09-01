#import "tum-font.typ": font-sizes
#import "utils.typ": print-section-before-chapters

#let print-zusammenfassung(body, sizes: font-sizes) = [
  #print-section-before-chapters(title: "Zusammenfassung", body, sizes: sizes)
]

#let body = [
  #lorem(120)

  #lorem(200)
]

#print-zusammenfassung(body)
