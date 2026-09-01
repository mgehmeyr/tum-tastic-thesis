#import "tum-font.typ": font-sizes
#import "utils.typ": print-section-before-chapters

#let print-acknowledgements(body, sizes: font-sizes) = [
  #print-section-before-chapters(title: "Acknowledgements", body, sizes: sizes)
]

#let body = [
  #lorem(120)

  #lorem(200)
]

#print-acknowledgements(body)
