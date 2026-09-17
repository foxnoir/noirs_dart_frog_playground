<a name="readme-top"></a>

<!-- Top Links Bar -->

[![LinkedIn](assets/badges/linkedin.svg)](https://www.linkedin.com/in/tanja-polz-5636401a5/)
[![X](assets/badges/x.svg)](https://twitter.com/_foxnoir_?lang=de)
[![Instagram](assets/badges/instagram.svg)](https://www.instagram.com/codeincouture/)

<!-- PROJECT LOGO -->
<br />

<div align="center">
  <img src="assets/logo.png" alt="Logo" width="179" height="179">
  <h1 align="center">Noir's Dart Frog Playground</h1>
  <p>
     Practice projects for Dart Frog — routes, middleware, requests, and Dart backends.
  </p>
</div>

---

<div align="left">

[![Dart](assets/badges/dart.svg)](https://dart.dev/)
[![Dart Frog](assets/badges/dart_frog.svg)](https://dart-frog.dev/)

</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-this-repository">About this repository</a></li>
    <li><a href="#projects">Projects</a></li>
    <li><a href="#badges">Badges</a></li>
  </ol>
</details>

---

## About this repository

This repository is a playground for practicing [Dart Frog](https://dart-frog.dev/) — technical exercises and conceptual understanding, paired with personal aesthetics. That is a conscious choice: it should please me first, not necessarily meet accessibility or current standards.

Each folder is a standalone practice project. Topics will include **routes**, **middleware**, **requests and responses**, and how a Dart API is structured — without mixing everything into one project.

The root README stays short: a link and a rough summary per project. Getting started and the detailed notes live in the README of that project.

<p align="right"><a href="#readme-top">back to top</a></p>

---

## Projects

<h3>
  <a href="dart_frog_lab/">Dart Frog Lab »</a>
</h3>

First scratch project from `dart_frog create`. Still the default template.

[README »](dart_frog_lab/README.md)

<p align="right"><a href="#readme-top">back to top</a></p>

---

## Badges

Tech-stack and social badges live once in [`assets/badges/`](assets/badges/). After changing labels or colors:

```
python3 assets/badges/generate.py
```

Target URLs sit **on the badge line** (`[![Dart](assets/badges/dart.svg)](https://dart.dev/)`). GitHub cannot import another file into a README, so there is no footer of `[dart-url]:` refs. The href list is [`assets/badges/links.json`](assets/badges/links.json) when you add a badge.

Every badge is a vertical dark → mid → light gradient (same contrast as Instagram). The mid stop is the brand or playground color. Official colors stay official, except black — it is hard to see. Everything else uses purple, blue, turquoise, pink, or green — not black, orange, red, or yellow.

| File | Color (dark → mid → light) | Why |
| --- | --- | --- |
| `dart.svg` | `#01406B` → `#0175C2` → `#7BB7DF` | official Dart |
| `dart_frog.svg` | `#194C2F` → `#2D8A56` → `#92C2A7` | frog green |
| `linkedin.svg` | `#06386B` → `#0A66C2` → `#80AFDF` | official LinkedIn |
| `instagram.svg` | `#4C3469` → `#8B5FBF` → `#C3ACDE` | lilac |
| `x.svg` | `#456576` → `#7EB8D6` → `#BCDAEA` | pastel light blue |

<p align="right"><a href="#readme-top">back to top</a></p>

<p align="center">
  <img src="assets/img/details_dragon.png" alt="Details dragon" width="280">
</p>
