#import "/src/cover-page.typ": *
#import "/src/lib.typ": tum-tower-image

#print-cover()
#print-cover(title: [A title test], subtitle: [A subtitle test])
#print-cover(title: [A title test])
#print-cover(
  title: [A title test],
  subtitle: [A subtitle],
  cover-image: image("/assets/TUM_Tower.svg"),
)
#print-cover(title: [A title test], cover-image: image("/assets/TUM_Tower.svg"))
#print-cover(title: [A title test], cover-image: tum-tower-image())
