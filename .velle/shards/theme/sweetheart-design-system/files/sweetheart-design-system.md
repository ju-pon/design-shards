# Sweetheart Design System

*A design system for keepsakes & grown-up things.*

A guide to carrying one feminine, classy identity across letters, essays, websites, portfolios, slides, print and playful pages. It grows out of two existing sources: a `style.css` web theme (warm and playful) and a `main.tex` Beamer theme (formal, "tarot elegant"). **Everything here is a dial, not a cage:** the same ingredients, mixed in different proportions.

---

## 1. The essence

**Butter, blush, mauve and a glint of gold.** The feeling is a handwritten note tucked into a well-made book: soft, warm, unhurried, and carefully finished. It is romantic without being childish, and ornate only in small, deliberate places.

### Five principles

1. **Warm paper, never stark white.** Backgrounds are cream or ivory; pure white appears only as "paper" on a card.
2. **One display voice.** An italic serif carries headlines and quiet elegance. Everything around it stays calm.
3. **Gold is a jewel, not a paint.** Use it for small things: a seal, a rule, a bullet, a highlight. If gold covers more than ~5% of a page, it stops feeling precious.
4. **Softness in the shapes.** Generous radii, pill buttons, diffuse mauve-tinted shadows (never grey).
5. **Handwriting is seasoning.** A few words at a time, always in a supporting role.

### Voice and copy

Speak warmly and plainly, as a thoughtful friend would. Sentence case, active verbs, specific words. Affection through detail ("the corner café where we met"), not through piled-up adjectives or exclamation marks. Tone rises and falls with the formality dial (§7): a birthday page can tease; a research talk should only smile.

---

## 2. Colour

The web and slide palettes drifted apart (mauve `#b97a93` vs `#B862A0`, gold `#e3b457` vs `#FCD57E`). The set below is the **reconciled** set. Use these values everywhere and treat the slide palette as an alias.

| Role | Name & hex | Use |
|---|---|---|
| Ground | Cream `#FDF7EE` | Page and slide background |
| Panel | Cream deep `#F7ECD9` | Sidebars, clue cards, code blocks |
| Paper | Paper `#FFFDF8` | Cards, frames, inputs |
| Wash | Blush soft `#FBE3EE` | Callouts, table stripes, quiet fills |
| Wash strong | Blush `#F7CFE0` | Badges, washi tape, folded corners |
| Accent | Rose `#E8A0BF` | Rules, borders, ornaments, focus glows |
| Brand | Mauve `#B97A93` | Large graphics, gradients, icons |
| Brand text | Mauve deep `#96586F` | Links, labels, small brand-coloured text |
| Deep accent | Mulberry `#6E3358` | Print headings, slide title bars, dark surfaces |
| Text | Plum `#5C3A4D` | Headings and main text |
| Text soft | Plum soft `#8A6577` | Body copy, captions (not below 14px) |
| Ink | Ink `#4A3040` | Text on gold; maximum contrast |
| Jewel | Gold `#E3B457` | Seals, bullets, highlights, hairlines |
| Jewel deep | Gold deep `#C99435` | Gold on light grounds, hover states |
| Gold text | Antique `#8F6A1E` | The only gold safe for readable text |
| Leaf | Sage `#9FB88B` | Success ticks and leaves, sparingly |

### Rules for using it

- **Proportions:** ~70% cream and paper, 15% plum text, 10% pink family, 5% gold.
- **Contrast:** Plum and ink on cream are comfortably high-contrast. Plum soft is fine for body copy. Rose, gold, sage and blush are **decorative only** — never for text, and never as the only signal of state. White text belongs on mauve deep or mulberry, not on rose.
- **Gradients:** only rose→mauve (buttons, progress) or a radial gold "seal". Keep them diagonal and soft.
- **Off-palette colours:** a single extra hue (e.g. teal for a second data series) is acceptable if it is desaturated and used for a functional reason. Name it and add it to the palette.

### Dark mode

Deep plum ground `#2A1E27`, surface `#35262F`, text `#F4E6EC`, soft text `#CDB0BF`, brand lifted to `#E3A9C0`. Gold and rose keep their hue. Shadows become darker and tighter, and the "paper" frames turn into plum surfaces.

---

## 3. Typography

| Role | Web | Print / LaTeX / Office |
|---|---|---|
| Display | Cormorant Garamond, italic 500–600 | EB Garamond or Libertine italic |
| Body | Quicksand 400–500, 17px, line-height 1.6 | Libertine / Biolinum, or a Garamond serif for long reading |
| Hand | Caveat 600 | A script face for one line at most; otherwise a real pen scan |
| Labels | Quicksand 600 or Cormorant small caps | `\scshape`, letter-spaced 2–4% |

### Scale

- H1: 2.4–3.6rem, italic · H2: 1.8–2.5rem, italic · H3: 1.4rem, upright
- Body: 1rem–1.06rem · Caption: 0.85rem · Hand accents: 1.3–1.6rem
- On paper: a 1.25 ratio from a 10.5pt body.
- Headings sit tight (line-height 1.1–1.2); body sits loose (1.6–1.7).

### Rules

- **Italic is for titles and quotations; small caps is for names of things** (labels, running heads, column headers). Avoid all caps except tiny badges.
- **Hand script** only for greetings, sign-offs, captions, margin notes and one-line clues. Never body text, never below 1.2rem, never more than ~a dozen words at a stretch.
- **Line length:** 55–70 characters for reading text; centre only short blocks (titles, invitations, quotes).
- Body serif alternative: for long essays, swap Quicksand for a warm text serif; keep Quicksand for UI and captions.
- Use real quotation marks, en dashes for ranges, and true italics. Enable ligatures and old-style numerals in print.

---

## 4. Shape, depth and motion

**Radius**
- Small 10px (inputs), medium 18px (cards), large 28px (feature panels), full pill for buttons and tags.
- Print equivalent: rounded rectangles at 3–6mm, or none at all when the ornaments do the talking.

**Shadow**
- Mauve-tinted and diffuse: tiny (`0 2 8` at 12%), soft (`0 4 20` at 14%), lift (`0 10 30` at 22%). Never black.
- Lift is for things that can be picked up (polaroids, envelopes).

**Borders**
- 1px in `#ECD6DE` around cards; 1.5px rose for outlined buttons; 3px rose or gold as a left rule on quotes and notes.
- Hairlines fade at both ends when used as dividers.

**Motion**
- Springy easing `cubic-bezier(.34, 1.56, .64, 1)`, ~0.35s, only in response to touch: hover lifts, envelope flaps, checked answers.
- One ambient effect per page at most (drifting petals). Always honour `prefers-reduced-motion`.

**Spacing**
- Base unit 0.5rem. Sections breathe at 4.5rem on desktop, 3rem on phones. Cards pad 1.5–2rem.
- In print: wide margins (25–30mm) and generous space above headings; whitespace is part of the luxury.

---

## 5. The ornament vocabulary

Ornaments are the identity's signature. Pick from this set, and repeat the same few across a document so they feel intentional.

- **Star divider** — gold rule, ✦ or ★, gold rule. The tarot mark; best for formal work.
- **Flourish rules** — a rose hairline fading out at both ends with a tiny glyph at centre (✦ ❀ ♡ ❦).
- **Corner stars** — a large gold star and a small pink star in opposite page corners, at 45–55% opacity.
- **Wax seal** — a radial gold disc with an initial or ♡. Primary buttons, envelope seals, signature marks.
- **Washi tape** — a translucent blush strip, slightly rotated, holding a polaroid or note.
- **Folded corner** — a blush triangle at the bottom-right of a note or clue.
- **Frames** — polaroid (thick bottom edge, ±3° tilt), gold-rimmed locket circle for one portrait, and a scalloped edge for keepsakes.
- **Petals** — five slow drifting petals as a background layer, for celebratory pages only.
- **Dotted trail** — a rose dashed line linking numbered stops, for journeys and timelines.

> **Restraint rule:** one hero ornament per view, plus small supporting marks. Take one away before you finish. Ornaments should mark a threshold (start, end, change of subject), not fill space.

---

## 6. Components, translated across media

| Component | Web | Slides / print |
|---|---|---|
| Primary action | Gold wax-seal pill, ink text | Gold-outlined label or a seal glyph |
| Secondary action | Rose→mauve gradient pill, or ghost with rose outline | Mauve deep small-caps text link |
| Card | Paper, 18–28px radius, soft shadow, blush hairline | Ivory box with a thin rose rule; no shadow on paper |
| Callout | Blush-soft fill, 3px gold left rule | Tinted block, gold rule, italic lead-in |
| Quote | Hand script, rose left border | Italic serif, large gold quotation mark |
| Table | No vertical lines, rose hairlines, small-caps headers | Same; alternate rows in blush soft |
| Bullets | Gold ✦ or rose dot | Gold star level one; pink diamond level two |
| Badge / tag | Blush pill, mauve deep text, tiny caps | Small caps in mauve deep |
| Progress | Blush track, rose→gold fill | Row of gold stars, some filled |
| Header strip | Cream with a hairline, or blush wash | Blush band with plum small-caps title, flush to the top edge |
| Footer | Centred sign-off in hand script | Gold hairline plus running title and page number, understated |

---

## 7. The dials

Every document sits somewhere between *keepsake* and *academic*. Choose a level first, then set the dials.

| Level | Hand script | Ornament | Gold | Corners | Motion |
|---|---|---|---|---|---|
| Keepsake | Frequent | Rich: petals, tape, seals | Generous, on seals and frames | Very round | Playful, springy |
| Warm | Headings and captions | Dividers, frames | Accents and buttons | Round | Hover and reveal |
| Editorial | Pull quotes, sign-off | One flourish per page | Hairlines, bullets | Soft | Minimal |
| Professional | Signature only | Star divider, footer rule | Rules only | Slight | None |
| Academic | None | Title flourish, footer hairline | Thin lines, highlights | Square or slight | Slide builds only |

---

## 8. Adapting to document types

### Letters and cards — *keepsake to warm*
Cream paper, generous 30mm margins, date and greeting in hand script, body in an italic-friendly serif at 11–12pt. One gold seal or ✦ above the sign-off; the signature in script with a small plum ink flourish. Envelopes: blush lining, rose flap, gold seal. For formal letters (cover letters, thank-yous to clients), drop script except the signature and use a star divider under the letterhead.

### Articles, essays and long reads — *editorial*
Single column 60–68 characters wide. Title in italic display; a hand-script eyebrow only if it adds context (series name, date). Body in a serif at 1.1rem with loose leading. Section breaks use the flourish rule. Pull quotes in hand script with a rose rule. Footnote headings in small caps, Plum soft. Drop caps in mauve deep welcome at the very start only. Photographs framed with a hairline and an italic caption.

### Websites and landing pages — *warm*
The hero shows the most characteristic thing about the subject: a locket portrait, a polaroid collage, or one gorgeous headline over a blush radial wash. Constrain content to an 880px wrap; alternate cream and blush-wash sections; pin a slim cream header with a mauve deep logotype. Navigation in Quicksand 600; one gold seal button per screen for the primary action. Include gold focus rings, 44px touch targets and reduced-motion support. Footer: script sign-off, rose hairline, tiny links.

### Portfolios and case studies — *editorial to professional*
Let the work be the colour; the frame is quiet. Paper cards for thumbnails with the lift shadow on hover; gold hairline under project titles; scallop or polaroid frames only for personal/hand-made work. Case studies open with the italic project title, a one-line summary, and a facts table (role, year, tools) in small caps. Captions in hand script if personal; Plum soft sans for client work. Keep imagery unaltered: no pink filters on other people's brand assets.

### Résumés and CVs — *professional*
One page, cream or white paper. Name in italic display at 28–36pt; contact line in small caps; section titles in mulberry small caps with a gold hairline beneath. Dates and roles in Quicksand; achievements as short bullets with tiny gold stars. No script except an optional initial monogram. Test in greyscale and through applicant-tracking software: decoration must not break plain-text parsing.

### Reports, whitepapers and proposals — *professional*
White or cream page, mulberry headings, plum body. Cover with title flourish, logo lockup and a star divider. Running head in small caps; footer with a gold hairline and page number. Charts use the palette in a fixed order: **mauve, gold, rose, sage, then plum**. Callouts in blush with a gold left rule for key takeaways. Keep tables airy with only horizontal hairlines.

### Slides and talks — *academic to editorial*
Follow the Beamer theme: title strip flush to the top in blush, small-caps mulberry title, gold hairline footer with frame number, star bullets. **One idea per slide.** Diagrams use white nodes with mulberry outlines and gold fill for "the selected thing". Reserve the alert block for one key insight per talk. Section-title slides can use a big ✦ and italic display text; the thank-you slide repeats the title flourish.

### Newsletters and email — *warm*
600px column, cream background with a paper card, web-safe fallbacks (Georgia italic for headings, system sans for body) because email clients ignore custom fonts. Images for ornaments rather than CSS masks. Gold seal button as a bulletproof table-cell button with 44px height. Sign-off as an image of a handwritten name if you want the script.

### Fun pages: quizzes, treasure hunts, invitations, birthdays — *keepsake*
Everything on. Quiz options as blush pills that flip to a rose→mauve gradient when chosen; a clue card in hand script with a folded corner; treasure stops as numbered gold discs on a dotted rose trail (numbers are justified here because it really is a sequence); an envelope that opens on hover to reveal the final note; petals drifting behind. Invitations lead with a locket or polaroid, details in italic display, RSVP as a gold seal. Add real, warm, specific copy, and a progress bar that fills rose→gold.

### Documentation, READMEs and technical writing — *professional*
Keep the reading experience clean: cream background, Quicksand body, mauve deep links, code blocks on cream deep with a rose left border and a monospace such as Beramono or Menlo. Syntax colours: keywords in bold mulberry, types in antique gold, strings in mauve, comments in Plum soft italic. Warnings use a gold-bordered blush note; success uses sage with a ✓ glyph **and** text, never colour alone.

### Social graphics and posters — *keepsake to editorial*
One large italic phrase on cream or blush, a hand-script line beneath, a gold seal or star in a corner. Leave 8–10% margin. For posters, use the frame vocabulary (locket, polaroid, scallop) around one image, and keep the palette to three colours plus gold.

### Stationery, menus, place cards and packaging — *warm to editorial*
Uncoated cream stock, mulberry ink, and gold foil or metallic ink for the star divider and seal only. Names in small caps, descriptions in italic, prices right-aligned after a fading dotted leader. Envelope liners in a blush pattern of tiny stars. Check print proofs in CMYK because the pinks shift.

### Dashboards and apps — *professional*
Cream ground, paper cards, 18px radius, one gold seal for the primary action. Keep data legible: sans for numbers, plum on paper, chart series in the fixed order (mauve, gold, rose, sage, plum). Delight belongs in empty states and confirmations (a short hand-script line and a tiny ornament), not in the data itself.

### Word processors, Google Docs and Notion — *editorial to professional*
Define styles once: Title in Cormorant italic, Heading 1–3 in plum, body in Quicksand or Georgia, links in mauve deep, and a custom "Callout" style with blush fill and gold left border. If custom fonts are unavailable, fall back to Georgia italic and Trebuchet or Calibri, and keep the colours — **the palette carries the identity when the fonts cannot.**

### Homework, problem sets and lab notebooks — *professional*
Cream paper, plum body serif or Quicksand, mulberry small-caps section titles ("Problem 1", "Method"). Number problems plainly; box final answers with a rose hairline, never gold. Tiny gold ✦ beside graded checkpoints only. Formulae in the same serif as body, not decorative script. A small hand-script "done!" or a star as a self-reward margin note is acceptable at warm level; drop it for anything submitted for credit at academic level.

### Research articles and theses — *academic*
Journal or thesis class (Libertine/Biolinum or EB Garamond), mulberry headings at `\section*`, plum body, small-caps running heads. Title flourish on the title page only; a plain gold hairline in the running footer. Figures framed with a hairline, captions in Plum soft italic, cross-references in mauve deep small caps. Theorem-like environments labelled in small caps with a rose left rule. No script anywhere except, optionally, the dedication page — one line, hand or script face.

### Conference posters and abstracts — *academic to editorial*
One italic headline over cream or blush; hierarchy from size, not colour. Diagrams in white nodes with mulberry outlines, gold fill for the highlighted contribution. Chart series in the fixed order; legend in small caps. A single ✦ star divider between background and results. Keep 8–10% clear margin; nothing touches the edge. QR codes sit inside a small paper card with a rose hairline, labelled in small caps.

### Formal reports, board papers and legal-ish documents — *professional*
Strict structure first: cover with star divider, small-caps running head, gold hairline footer with page numbers and document reference. Mulberry headings numbered in the house style; body plum on cream. Tables with horizontal hairlines only; key decisions highlighted in a blush callout with a gold left rule. No hand script, no petals, no gradients. A single ✦ may close the executive summary.

### Casual notes, to-do lists and personal pages — *keepsake*
Everything playful: washi tape on a paper card, hand-script headings, petals drifting behind, dotted rose trails linking steps. Progress fills rose→gold. Folded corners on anything that reads like a clue. Still keep one hero ornament per view and no script in body copy — warmth comes from the copy, not from font overload.

---

## 9. Accessibility, print and performance

- Body text and its background must reach at least **4.5:1** contrast; large text **3:1**. Check every new pairing.
- Keep the **gold focus ring** (3px, 3px offset) on every interactive element. Never remove it.
- **State is never colour alone:** pair sage or rose with a glyph or word ("✓ found").
- Respect `prefers-reduced-motion` and give ambient animation a way to stop.
- Alt text describes the photograph, not the frame. Decorative ornaments use `aria-hidden` or empty alt.
- **Print:** convert to greyscale to confirm hierarchy survives. Keep gold as a spot colour or a 4-colour approximation; avoid pale gold on white.
- Load at most two or three font files. Provide fallbacks (Georgia, system-ui) so layouts hold if fonts fail.

---

## 10. Do and don't

**Do**
- Start from cream and plum, then add one jewel.
- Repeat the same three ornaments through a document.
- Let whitespace and italics do the elegance.
- Write with specific, tender details.
- Test on a phone and in greyscale.

**Don't**
- Use pure white, pure black or grey shadows.
- Put script in body copy or long headings.
- Use gold or rose for small text.
- Stack every ornament on one page.
- Turn every block into an identical rounded card.

---

## 11. Token reference

### CSS

```css
:root{
  --cream:#fdf7ee; --cream-deep:#f7ecd9; --paper:#fffdf8;
  --blush:#f7cfe0; --blush-soft:#fbe3ee; --rose:#e8a0bf;
  --mauve:#b97a93; --mauve-deep:#96586f; --mulberry:#6e3358;
  --plum:#5c3a4d; --plum-soft:#8a6577; --ink:#4a3040;
  --gold:#e3b457; --gold-deep:#c99435; --gold-text:#8f6a1e;
  --sage:#9fb88b;
  --font-display:'Cormorant Garamond',Georgia,serif;
  --font-body:'Quicksand',system-ui,sans-serif;
  --font-hand:'Caveat',cursive;
  --radius-sm:10px; --radius-md:18px; --radius-lg:28px;
  --ease-sweet:cubic-bezier(.34,1.56,.64,1);
}
```

### LaTeX / Beamer

```latex
\definecolor{Cream}{HTML}{FDF7EE}
\definecolor{Blush}{HTML}{FBE3EE}
\definecolor{Rose}{HTML}{E8A0BF}
\definecolor{AccentPink}{HTML}{B97A93}
\definecolor{AccentPinkDark}{HTML}{6E3358}
\definecolor{AccentPinkLight}{HTML}{FBE3EE}
\definecolor{AccentGold}{HTML}{E3B457}
\definecolor{GoldText}{HTML}{8F6A1E}
\definecolor{Ink}{HTML}{4A3040}
```

### Starter `style.css` (web, editorial level)

A starter stylesheet for plain semantic HTML (h1, h2, h3, ul, li, a — no classes needed except `.theme-toggle`) is embedded in `sweetheart-design-system.html` as `#css-src`. Key points:

- Tokens as CSS custom properties, with dark mode via `prefers-color-scheme` plus an explicit `[data-theme]` override; blush `::selection`; gold `:focus-visible` outline (3px / 3px offset).
- Body: `max-width: 44rem`, `font: 17px/1.65 Quicksand`, cream background with two soft radial blush/gold glows.
- H1/H2 in Cormorant italic 600 with a fading rose hairline after H1 and a gold ✦ jewel before H2; H3 in small caps, mauve deep.
- Gold ✦ list markers; underlined links (rose decoration, mauve deep colour) that warm to antique gold on hover.
- A fixed 44px round `.theme-toggle` button with springy hover (`translateY(-2px) rotate(-12deg)`).
- Reduced-motion kill-switch and a plain, ink-friendly `@media print` block (black text, printed URLs, no toggle).

### Starting checklist for any new document

1. Choose a level on the dial (§7).
2. Set the ground to cream, text to plum, links to mauve deep.
3. Pick display, body and, if the level allows, a hand accent.
4. Choose one hero ornament and two supporting marks.
5. Allow gold in one job only (seal, rule or bullet).
6. Check contrast, focus, greyscale and the small-screen or print proof.
7. Remove one decoration.

*with love, and a little gold ✦*