#let package(name) = {
  let packages = (
    glossarium: "0.5.10",
    dashy-todo: "0.1.3",
    tum-tastic-thesis: "0.1.11",
  )
  // This fork is published as a private package on typst.app instead of
  // through @preview -- see the fork's own README for how to set that up.
  let local-packages = ("tum-tastic-thesis",)

  let version = packages.at(name)
  let namespace = if local-packages.contains(name) { "@local/" } else { "@preview/" }

  namespace + name + ":" + version
}
