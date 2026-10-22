# CV maintenance

The CV and the website are maintained together in this repository. For each requested change to shared personal information, the agent edits both the TeX source and the website's content in the same changeset, following [AGENTS.md](../AGENTS.md), unless the user explicitly limits the request to one format.

The supplied TeX assets are the current reference for personal CV facts. The old PDF is retained for history and is not a reference for correcting the website or TeX source.

## Files

| Path                              | Purpose                                                                      |
| --------------------------------- | ---------------------------------------------------------------------------- |
| `source/resume.tex`               | Main TeX document, header, layout settings, and section inclusion order      |
| `source/russell.cls`              | CV document class and formatting                                             |
| `source/cv/education.tex`         | Education and coursework                                                     |
| `source/cv/achievements.tex`      | Competitive programming results, research awards, and Codeforces information |
| `source/cv/projects.tex`          | Research projects; this original filename refers to the research section     |
| `source/cv/software-projects.tex` | Reinventing the Wheel, matching the website's project summary and highlights |
| `source/cv/experience.tex`        | Internships and teaching experience                                          |
| `source/cv/skills.tex`            | Programming skills                                                           |
| `source/cv/fonts/`                | Fonts included in the supplied source archive                                |
| `archive/CV_20240314.zip`         | Unmodified original source archive                                           |
| `archive/CV_20240314.pdf`         | Unmodified original PDF                                                      |
| `../assets/pdf/cv.pdf`            | Public downloadable PDF compiled from the current working TeX source         |
| `build.sh`                        | Shared local and GitHub Actions compilation script                           |
| `build/`                          | Ignored temporary LaTeX output                                               |

The original archive also contains optional sections and commented examples from the template. Only the active inputs in `source/resume.tex` are part of the CV. Those examples do not establish personal facts.

## Update both formats

The website's CV and award data live in `../_data/cv.yml`. The biography and selected achievements appear on `../_pages/about.md`; the dedicated awards page uses the shared CV data. Project descriptions live in `../_projects/`.

The web CV uses the site-owned `../_includes/cv_profile.liquid` with styles scoped to `.cv-document` in `../assets/css/cv.css`. It reads the shared data directly, with research represented by `title`, `date`, and `highlights`. The date and award helpers control presentation; keep personal claims out of the templates. Changes to the website's layout or data structure alone do not change the TeX content or require a local PDF rebuild.

Both CVs present sections in this order: **Education → Achievements → Experience → Projects → Research → Skills**. The website's section navigation follows that order; Achievements retains the `#awards` anchor and `Awards` data key. In the PDF, Education, Achievements, Experience, and Projects occupy page one, with Research and Skills on page two.

For example, an award update changes both `_data/cv.yml` and `source/cv/achievements.tex`. A research update changes the website CV and `source/cv/projects.tex`. Website project pages can provide more detail than the printed CV; shared names, dates, results, and claims must agree.

Shared website award titles match the PDF's bold titles exactly, including the full ICPC World Finals name and contest years. The PDF groups achievements into Competitive Programming, preserving the existing ICPC-first order, and Research & Hackathon Awards, ordered by newest year. The latter includes Nexon Young Programmers Cup 2026 — Master Track (Bronze Prize, 9th place), 2026 Korea Quantum Information Competition (Director’s Award, 3rd place), and the Samsung Humantech awards. The website uses category `research-hackathon` for this group. The quantum entry intentionally omits the awarding center and team name.

Capitalization follows [AGENTS.md](../AGENTS.md): headings, research titles, and award labels use title case; rankings use lowercase `place`; descriptive prose uses sentence case. Examples are `9th place (Bronze Medal)`, `1st place (Champion)`, and `Bronze Prize (9th place)`. Preserve official names/acronyms and team casing. The PDF's uppercase main headings are a presentation choice; shared entry wording follows the same rules as the website.

Software project updates pair `cv.sections.Projects` in `_data/cv.yml` with `source/cv/software-projects.tex`, and update the related `_projects/` page when affected. The initial project descriptions copy the website CV's summaries and highlights as a draft for later editing. Project titles link to their website detail pages, and source links open their repositories. No project dates are inferred.

PS Checklist is a persistent exception: it remains in the website CV and project pages but is excluded from the TeX CV and compiled PDF. Preserve this difference during future synchronization unless the user explicitly asks to include it in the PDF again, as recorded in [AGENTS.md](../AGENTS.md).

Google Code Jam 2021 (Round 3, 196th place) and Google Kick Start 2020 (Round B, 28th place) are also intentionally excluded from the TeX CV and compiled PDF. Keep both results in the website CV and Awards page, and preserve this exception during future synchronization unless the user explicitly requests their return to the PDF.

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

## Project descriptions added on 2026 10 21

The initial Projects section included Reinventing the Wheel and PS Checklist, with draft explanations matching the website CV's project summaries and highlights. PS Checklist was subsequently removed from the PDF at the user's request and remains on the website. Refine the remaining project's descriptions in `source/cv/software-projects.tex` alongside the website data.

The CV has two pages. The original layout started Projects on the second page, followed by Experience and Skills. The current layout places Experience and Projects after Achievements on page one, with Research and Skills on page two. An explicit page break follows Projects. Review both pages after building with `./cv/build.sh` before replacing the public PDF.

## CircuitSim description revised on 2026 10 23

The Reinventing the Wheel entry now uses four approved points in both CVs: hardware observability, implemented hardware and future directions, the computer architecture research purpose, and the event-driven C++20 engine with structural/behavioral models, gate-derived delay tables, and graph-based safe clock computation. The website CV's summary and three highlights match the TeX's four bullets word for word.

The dedicated project page expands those points using the local CircuitSim source and current records. It distinguishes scripted game execution and recorded playback from planned live sessions, and identifies AI accelerators and general-purpose GPUs as future directions. PS Checklist remains website-only.
