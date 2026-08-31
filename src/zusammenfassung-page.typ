#import "utils.typ": print-section-before-chapters

#let print-zusammenfassung(body) = [
  #print-section-before-chapters(title: "Zusammenfassung", body)
]

#let body = [
  #lorem(120)

  #lorem(200)
]

#print-zusammenfassung(body)
