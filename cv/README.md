# CV maintenance

The CV and the website are maintained together in this repository. For each requested change to shared personal information, the agent edits both the TeX source and the website's content in the same changeset, following [AGENTS.md](../AGENTS.md), unless the user explicitly limits the request to one format.

The supplied TeX assets are the current reference for personal CV facts. The old PDF is retained for history and is not a reference for correcting the website or TeX source.

## Files

| Path                         | Purpose                                                                      |
| ---------------------------- | ---------------------------------------------------------------------------- |
| `source/resume.tex`          | Main TeX document, header, layout settings, and section inclusion order      |
| `source/russell.cls`         | CV document class and formatting                                             |
| `source/cv/education.tex`    | Education and coursework                                                     |
| `source/cv/achievements.tex` | Competitive programming results, research awards, and Codeforces information |
| `source/cv/projects.tex`     | Research projects; this original filename refers to the research section     |
| `source/cv/experience.tex`   | Internships and teaching experience                                          |
| `source/cv/skills.tex`       | Programming skills                                                           |
| `source/cv/fonts/`           | Fonts included in the supplied source archive                                |
| `archive/CV_20240314.zip`    | Unmodified original source archive                                           |
| `archive/CV_20240314.pdf`    | Unmodified original PDF                                                      |
| `../assets/pdf/cv.pdf`       | Public downloadable PDF compiled from the current working TeX source         |
| `build.sh`                   | Shared local and GitHub Actions compilation script                           |
| `build/`                     | Ignored temporary LaTeX output                                               |

The original archive also contains optional sections and commented examples from the template. Only the active inputs in `source/resume.tex` are part of the CV. Those examples do not establish personal facts.

## Update both formats

The website's CV and award data live in `../_data/cv.yml`. The biography and selected achievements appear on `../_pages/about.md`; the dedicated awards page uses the shared CV data. Project descriptions live in `../_projects/`.

For example, an award update changes both `_data/cv.yml` and `source/cv/achievements.tex`. A research update changes the website CV and `source/cv/projects.tex`. Website project pages can provide more detail than the printed CV; shared names, dates, results, and claims must agree.

Keep the TeX and website independently editable. Synchronization is performed by the agent as part of the requested edit, rather than by a YAML-to-TeX generator.

## Build the public PDF

The class uses `fontspec` and `unicode-math`. The shared build script uses [Tectonic](https://tectonic-typesetting.github.io/), a XeTeX-based compiler that downloads and caches the required TeX packages. The script pins version 0.17.0 and verifies the Linux binary's SHA-256 before installing it in the user cache. It does not install system packages.

From the repository root:

```bash
./cv/build.sh
```

The first run needs network access for the compiler and TeX packages; later builds reuse the cache. The bootstrap supports Linux x86_64, including GitHub's Ubuntu runner. On another platform, install Tectonic and run `TECTONIC_BIN=/path/to/tectonic ./cv/build.sh`. The script only builds `cv/build/resume.pdf`; it does not replace the public download.

Review the rendered PDF, then publish the local download from the repository root:

```bash
install -m 0644 cv/build/resume.pdf assets/pdf/cv.pdf
```

### Traditional XeLaTeX alternative

If using a TeX Live installation, the class needs packages including `fontawesome5`, `roboto`, `sourcesanspro`, `newtxtext`, and `tcolorbox`.

From the repository root, on a machine with `latexmk` and XeLaTeX installed:

```bash
mkdir -p cv/build
cd cv/source
latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=../build resume.tex
```

Review `cv/build/resume.pdf`, then run from the repository root:

```bash
install -m 0644 cv/build/resume.pdf assets/pdf/cv.pdf
```

Build failures must leave the last valid public PDF in place. Keep intermediate files in `cv/build/`, and check the rendered PDF for clipping, page breaks, fonts, and working links. The `cv/` source and archive directory is excluded from the generated website; `assets/pdf/cv.pdf` is published.

## GitHub Actions

`.github/workflows/deploy.yml` runs the same `./cv/build.sh` on each branch push except `gh-pages` and `template/al-folio`, on pull requests to `main`, and on manual runs. It caches the compiler and TeX packages, uploads the compiled `cv.pdf` as the `jaemin-park-cv` artifact for 30 days, and makes the site build depend on successful compilation.

The Jekyll job downloads that artifact into `assets/pdf/` before building. Publication from `main` therefore contains the freshly compiled PDF. Actions does not commit generated files back to the source branch. A source error stops the workflow before publication instead of deploying a stale PDF.

## Import notes from 2026 10 20

The working source was extracted from the supplied ZIP. Both archived original files retain their original bytes. At the user's request, the initial import updated the website from the new TeX assets and left the TeX source unchanged. No TeX compilation was performed during that import.

The subsequent request added a current compiled public PDF and compilation on every push. The legacy download was replaced by a one-page build from `source/resume.tex`; the archived old PDF remains historical. The working source fixes an invalid table-cell line break in education and an extra line break after achievements. Table widths and section spacing were adjusted to fit the content on one page. Personal facts were preserved.

The website now uses the source's Codeforces rating **2715** and International Grandmaster title. The undated rating is not labeled current or peak. The old PDF's different rating is superseded by the supplied TeX reference; it does not require further reconciliation for this import.
