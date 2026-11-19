// ---------------------------------------------------------------------------
//  sweetheart-hw.typ
//  Homework / problem-set template in the Sweetheart Design System.
//  Level on the dial: PROFESSIONAL (cream paper, plum serif, mulberry small caps).
//  Single file, compatible with Typst 0.11.1.
//  Fonts: EB Garamond, Bera Mono (fallbacks included).
//
//  Usage
//    #import "sweetheart-hw.typ": *
//    #show: homework.with(course: "...", title: "...", author: "...", id: "...")
//
//    #problem("Title", points: [2 pts])[ statement ]
//    #answer[ ... ]
//    #final-answer[ ... ]                    boxed result
//    #callout(lead: "Note")[ ... ]           key takeaway
//    #figure(hwtable(...), caption: [...])   numbered table (first row = header)
//    #hwfigure(image("file.png", width: 80%), caption: [...])   framed image
//    ```python ... ```                       code (wrap in #figure(..., caption: [...]) to caption it)
//    #checkpoint                             gold margin star, at the start of a paragraph
//  Pass print: true to homework.with(...) for a white page.
// ---------------------------------------------------------------------------

// ---------- Palette (reconciled set, section 2) ----------------------------
#let cream = rgb("#FDF7EE")
#let cream-deep = rgb("#F7ECD9")
#let paper = rgb("#FFFDF8")
#let blush-soft = rgb("#FBE3EE")
#let blush = rgb("#F7CFE0")
#let rose = rgb("#E8A0BF")
#let mauve = rgb("#B97A93")
#let mauve-deep = rgb("#96586F")
#let mulberry = rgb("#6E3358")
#let plum = rgb("#5C3A4D")
#let plum-soft = rgb("#8A6577")
#let ink = rgb("#4A3040")
#let gold = rgb("#E3B457")
#let gold-deep = rgb("#C99435")
#let antique = rgb("#8F6A1E")
#let sage = rgb("#9FB88B")
#let hairline = rgb("#ECD6DE")

// ---------- Fonts (first one found wins) -----------------------------------
#let serif = ("EB Garamond", "Libertinus Serif")
#let mono = ("Bera Mono", "Menlo", "DejaVu Sans Mono")

// ---------- Small helpers --------------------------------------------------
// Small caps, letter-spaced: for "names of things" (labels, running heads).
#let lbl(body, fill: plum-soft, size: 0.85em) = text(
  size: size, fill: fill, tracking: 0.08em, smallcaps(body),
)

// Four-point star: gold jewel (bullets, dividers, graded checkpoints)
#let star(fill: gold, size: 0.45em) = box(
  width: 2 * size, height: 2 * size, baseline: 0.15em,
  polygon(
    fill: fill, stroke: none,
    (1 * size, 0pt), (1.22 * size, 0.78 * size), (2 * size, 1 * size),
    (1.22 * size, 1.22 * size), (1 * size, 2 * size), (0.78 * size, 1.22 * size),
    (0pt, 1 * size), (0.78 * size, 0.78 * size),
  ),
)

// Tiny pink diamond: second-level bullets
#let diamond(fill: rose, size: 0.3em) = box(
  width: 2 * size, height: 2 * size, baseline: 0.15em,
  polygon(
    fill: fill, stroke: none,
    (1 * size, 0pt), (2 * size, 1 * size), (1 * size, 2 * size), (0pt, 1 * size),
  ),
)

// Star divider: gold rule, star, gold rule.   #divider(width: 40%)
#let divider(width: 40%) = align(center, block(
  width: width, above: 0.8em, below: 0.8em,
  grid(
    columns: (1fr, auto, 1fr), column-gutter: 0.7em, align: horizon,
    line(length: 100%, stroke: 0.5pt + gold),
    star(),
    line(length: 100%, stroke: 0.5pt + gold),
  ),
))

// Graded checkpoint: put at the very start of a paragraph -> gold star in the margin
#let checkpoint = box(width: 0pt, place(dx: -1.5em, dy: -0.75em, star()))

// ---------- Boxes: questions, final answers, callouts ----------------------
// The question as set by the instructor: blush wash, rose rule on the left
#let question(body) = block(
  width: 100%, above: 0.6em, below: 1em,
  fill: blush-soft, stroke: (left: 2.5pt + rose),
  inset: (left: 5mm, right: 4mm, y: 3mm),
  body,
)

// Final answer: paper box, rose hairline (never gold)
#let final-answer(body) = block(
  width: 100%, above: 1.5em, below: 1.2em, breakable: false,
  fill: paper, stroke: 0.6pt + rose, radius: 2pt,
  inset: (x: 4mm, top: 4mm, bottom: 3mm),
)[
  #place(top + left, dy: -4mm - 0.55em,
    box(fill: paper, inset: (x: 3pt), lbl(fill: mauve-deep)[Final answer]))
  #align(center, body)
]

// Callout: blush fill, gold left rule, italic lead-in.   #callout(lead: "Note")[...]
#let callout(lead: none, body) = block(
  width: 100%, above: 1em, below: 1em,
  fill: blush-soft, stroke: (left: 3pt + gold),
  inset: (left: 5mm, right: 4mm, y: 3mm),
)[
  #if lead != none [#text(fill: mulberry, style: "italic")[#lead.] ]
  #body
]

// ---------- Problems and answers -------------------------------------------
// #problem("Title", points: [3 pts])[ statement ]
#let problem-count = counter("hw-problem")

#let problem(title, points: none, body) = {
  problem-count.step()
  v(1.6em, weak: true)
  block(breakable: false, width: 100%, below: 0.6em)[
    #grid(
      columns: (1fr, auto), align: (left, right),
      lbl(fill: mulberry, size: 1em)[Problem #context problem-count.display()],
      if points != none [#lbl(points)] else [],
    )
    #v(0.1em)
    #text(size: 1.45em, style: "italic")[#title]
    #v(0.1em)
    #line(length: 100%, stroke: 0.5pt + rose)
  ]
  question(body)
}

// #answer[ ... ]
#let answer(body) = {
  block(breakable: false, above: 1em, below: 0.5em, lbl(fill: mauve-deep)[Answer])
  body
  v(0.8em)
}

// ---------- Tables ---------------------------------------------------------
// #hwtable(columns: 3, align: right, [A], [B], [C], [1], [2], [3], ...)
// The first row is the header. Wrap in #figure(..., caption: [...]) to number it.
#let hwtable(columns: auto, align: auto, ..cells) = {
  set text(features: ("tnum", "lnum"))
  show table.cell.where(y: 0): set text(
    fill: mauve-deep, tracking: 0.06em, features: ("smcp", "tnum", "lnum"),
  )
  table(
    columns: columns, align: align,
    inset: (x: 9pt, y: 6pt),
    stroke: (x, y) => if y == 0 { (top: 0.8pt + rose, bottom: 0.5pt + rose) },
    fill: (x, y) => if y > 0 and calc.odd(y) { blush-soft },
    ..cells,
    table.hline(stroke: 0.8pt + rose),
  )
}

// ---------- Figures --------------------------------------------------------
// #hwfigure(image("fig.png", width: 80%), caption: [Caption.])   -- hairline-framed image
#let hwfigure(img, caption: none) = figure(
  box(stroke: 0.5pt + hairline, fill: paper, inset: 4pt, img),
  caption: caption,
)

// ---------- The document template ------------------------------------------
// #show: homework.with(course: "...", title: "...", author: "...", id: "...")
// Pass print: true to keep the page white (paper copy).
#let homework(
  course: "",
  title: "",
  author: "",
  id: "",
  date: datetime.today().display("[day] [month repr:long] [year]"),
  print: false,
  body,
) = {
  set document(title: title, author: author)

  set page(
    paper: "a4",
    margin: (x: 25mm, top: 28mm, bottom: 30mm),
    fill: if print { none } else { cream },
    header: context {
      if counter(page).get().first() > 1 {
        grid(columns: (1fr, auto), lbl(course), lbl(author))
      }
    },
    footer: context [
      #line(length: 100%, stroke: 0.5pt + gold)
      #v(-0.3em)
      #grid(
        columns: (1fr, auto),
        lbl(title),
        lbl(counter(page).display()),
      )
    ],
  )

  set text(font: serif, size: 11pt, fill: plum, lang: "en")
  set par(leading: 0.8em)
  set par(
    justify: true,
    leading: 0.8em,
    first-line-indent: 15pt,
  )
  show par: set block(spacing: 0.8em)

  // Formulae: use a Garamond-friendly math font if you have one, else Typst's default
  show math.equation: set text(font: ("Libertinus Math", "New Computer Modern Math"))

  // Headings, in case you use `= Heading` somewhere
  show heading: it => block(
    above: 1.4em, below: 0.8em,
    text(fill: mulberry, weight: "regular", smallcaps(it.body)),
  )

  // Links
  show link: set text(fill: mauve-deep)
  show link: underline

  // Lists: gold star level one, pink diamond level two; (a) sub-questions
  set list(marker: (star(), diamond()), indent: 0.3em, body-indent: 0.6em)
  set enum(numbering: "(a)", indent: 0.3em, body-indent: 0.6em)

  // Code: panel on cream deep with a rose left rule (syntax colours: Typst's default theme)
  show raw: set text(font: mono, size: 0.85em)
  show raw.where(block: true): it => block(
    width: 100%, above: 1em, below: 1em,
    fill: cream-deep, stroke: (left: 1.5pt + rose),
    inset: (left: 10pt, right: 8pt, y: 8pt),
    align(start, it),
  )
  show raw.where(block: false): it => box(
    fill: cream-deep, inset: (x: 3pt), outset: (y: 3pt), radius: 2pt, it,
  )

  // Captions: small-caps label in mauve deep, italic text in plum soft
  show figure.caption: it => {
    set text(size: 0.9em)
    text(fill: mauve-deep, smallcaps[#it.supplement #context it.counter.display(it.numbering)])
    [. ]
    text(fill: plum-soft, style: "italic", it.body)
  }
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: raw): set figure.caption(position: top)
  show figure: set block(above: 1.2em, below: 1.2em)

  // Title block
  align(center)[
    #lbl(course)
    #v(0.3em)
    #text(size: 30pt, style: "italic")[#title]
    #divider()
    #lbl(fill: mauve-deep)[
      #author
      #if id != "" [ #sym.dot.c #id ]
      #sym.dot.c #date
    ]
  ]
  v(1.2em)

  body
}

// ---------------------------------------------------------------------------
//  Codly theme (pinned to 1.0.0 for Typst 0.11.1)
//  Use after the main template:
//    #show: homework.with(...)
//    #show: sweetheart-codly
// ---------------------------------------------------------------------------
#import "@preview/codly:1.0.0": *

#let sweetheart-codly(body) = {
  show: codly-init.with()
  codly(
    // Language tags: soft pink label, no icons. Add the languages you use.
    languages: (
      python: (name: "Python", icon: "", color: rose),
      rust: (name: "Rust", icon: "", color: rose),
      c: (name: "C", icon: "", color: rose),
      cpp: (name: "C++", icon: "", color: rose),
      java: (name: "Java", icon: "", color: rose),
      javascript: (name: "JavaScript", icon: "", color: rose),
      bash: (name: "Bash", icon: "", color: rose),
      matlab: (name: "MATLAB", icon: "", color: rose),
      r: (name: "R", icon: "", color: rose),
      julia: (name: "Julia", icon: "", color: rose),
      ocaml: (name: "OCaml", icon: "", color: rose),
    ),
    display-icon: false,
    fill: cream-deep,
    zebra-fill: none,
    stroke: 0.6pt + rose,
    radius: 3pt,
    number-align: right,
    // #7A5568 is plum-soft nudged darker to reach 4.5:1 on cream-deep
    number-format: n => text(fill: rgb("#7A5568"), size: 0.85em, str(n)),
  )
  body
}

