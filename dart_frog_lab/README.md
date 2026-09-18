<a name="readme-top"></a>

<!-- Top Links Bar -->

[![LinkedIn](../assets/badges/linkedin.svg)](https://www.linkedin.com/in/tanja-polz-5636401a5/)
[![X](../assets/badges/x.svg)](https://twitter.com/_foxnoir_?lang=de)
[![Instagram](../assets/badges/instagram.svg)](https://www.instagram.com/codeincouture/)

<!-- PROJECT LOGO -->
<br />

<div align="center">
  <img src="../assets/logo.png" alt="Logo" width="179" height="179">
  <h1 align="center">Dart Frog Lab</h1>
  <p>
     First scratch project for trying Dart Frog — routes, requests, and a Dart backend.
  </p>
</div>

---

<div align="left">

[![Dart](../assets/badges/dart.svg)](https://dart.dev/)
[![Dart Frog](../assets/badges/dart_frog.svg)](https://dart-frog.dev/)
[![Very Good Analysis](../assets/badges/very_good.svg)](https://pub.dev/packages/very_good_analysis)

</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about">About</a></li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#hot-reload-required-pin">Hot reload (required pin)</a></li>
      </ul>
    </li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#changelog">Changelog</a></li>
    <li><a href="#sources">Sources</a></li>
  </ol>
</details>

---

## About

This project is the first **Dart Frog** practice project in [Noir's Dart Frog Playground](../README.md). It started from `dart_frog create` and is still close to the default template — a trainee app to try the framework a bit before the later labs.

[![Dart Frog](../assets/badges/dart_frog.svg)](https://dart-frog.dev/)

`dart_frog dev` serves [http://localhost:8080](http://localhost:8080).

<p align="right"><a href="#readme-top">back to top</a></p>

---

## Getting Started

Clone the playground, then open this project folder:

```
https://github.com/foxnoir/noirs_dart_frog_playground.git
```

```
git@github.com:foxnoir/noirs_dart_frog_playground.git
```

```
cd dart_frog_lab
dart pub get
dart_frog dev
```

Then open [http://localhost:8080](http://localhost:8080).

Packages live in `pubspec.yaml` (do not copy versions from this README; they move). Runtime: `dart_frog`. Dev: `dart_frog_lint`, `very_good_analysis`, `mocktail`, `test`.

<p align="right"><a href="#readme-top">back to top</a></p>

### Hot reload (required pin)

`dart_frog_cli` 1.2.14 pulls `hotreloader` **4.4.0**. That version only watches `bin/`, `lib/`, and `test/`. Dart Frog handlers live in `routes/`, so the isolate never reloads.

What that looks like:

- Save `routes/index.dart` or press `r` / `R` in the terminal.
- The CLI prints `[codegen] reload complete.`
- A browser refresh still serves the **old** body.
- Only a full `dart_frog dev` restart picks up the change.

A real isolate reload would log `[hotreload] … Application reloaded.`

**Fix:** pin `hotreloader` 4.3.0 (it still watches the whole project, including `routes/`). This is the workaround from [dart_frog#1953](https://github.com/dart-frog-dev/dart_frog/issues/1953) / [hotreloader#28](https://github.com/vegardit/dart-hotreloader/issues/28):

```yaml
# pubspec_overrides.yaml
dependency_overrides:
  # https://github.com/vegardit/dart-hotreloader/issues/28
  hotreloader: 4.3.0
```

Then:

```
dart pub get
```

Restart `dart_frog dev`. After that, changing a route should log the hotreload line and show up on refresh.

<p align="right"><a href="#readme-top">back to top</a></p>

---

## Testing

`test/` mirrors `routes/`. A test file belongs to one source file (`index.dart` → `index_test.dart`).

```
cd dart_frog_lab
dart test
```

<p align="right"><a href="#readme-top">back to top</a></p>

---

## Changelog

Changes to this playground: [noirs_dart_frog_playground](https://github.com/foxnoir/noirs_dart_frog_playground).

<p align="right"><a href="#readme-top">back to top</a></p>

---

## Sources

- [Dart Frog](https://dart-frog.dev/)
- [dart_frog](https://pub.dev/packages/dart_frog)
- [dart_frog_lint](https://pub.dev/packages/dart_frog_lint)
- [very_good_analysis](https://pub.dev/packages/very_good_analysis)
- [hotreloader#28](https://github.com/vegardit/dart-hotreloader/issues/28)

<p align="right"><a href="#readme-top">back to top</a></p>
