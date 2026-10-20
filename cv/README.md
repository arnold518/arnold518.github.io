# CV maintenance

The CV and the website are maintained together in this repository. For each requested change to shared personal information, the agent edits both the TeX source and the website's content in the same changeset, following [AGENTS.md](../AGENTS.md), unless the user explicitly limits the request to one format.

The supplied TeX assets are the current reference for personal CV facts. The old PDF is retained for history and is not a reference for correcting the website or TeX source.

## Files

| Path                         | Purpose                                                                                    |
| ---------------------------- | ------------------------------------------------------------------------------------------ |
| `source/resume.tex`          | Main TeX document, header, layout settings, and section inclusion order                    |
| `source/russell.cls`         | CV document class and formatting                                                           |
| `source/cv/education.tex`    | Education and coursework                                                                   |
| `source/cv/achievements.tex` | Competitive programming results, research awards, and Codeforces information               |
| `source/cv/projects.tex`     | Research projects; this original filename refers to the research section                   |
| `source/cv/experience.tex`   | Internships and teaching experience                                                        |
| `source/cv/skills.tex`       | Programming skills                                                                         |
| `source/cv/fonts/`           | Fonts included in the supplied source archive                                              |
| `archive/CV_20240314.zip`    | Unmodified original source archive                                                         |
| `archive/CV_20240314.pdf`    | Unmodified original PDF                                                                    |
| `../assets/pdf/cv.pdf`       | Public downloadable PDF; currently the legacy copy, replaced after a successful CV rebuild |
| `build/`                     | Ignored temporary LaTeX output                                                             |

The original archive also contains optional sections and commented examples from the template. Only the active inputs in `source/resume.tex` are part of the CV. Those examples do not establish personal facts.

## Update both formats

The website's CV and award data live in `../_data/cv.yml`. The biography and selected achievements appear on `../_pages/about.md`; the dedicated awards page uses the shared CV data. Project descriptions live in `../_projects/`.

For example, an award update changes both `_data/cv.yml` and `source/cv/achievements.tex`. A research update changes the website CV and `source/cv/projects.tex`. Website project pages can provide more detail than the printed CV; shared names, dates, results, and claims must agree.

Keep the TeX and website independently editable. Synchronization is performed by the agent as part of the requested edit, rather than by a YAML-to-TeX generator.

## Build the public PDF

The class uses `fontspec` and `unicode-math`, so use XeLaTeX with the required TeX packages, including `fontawesome5`, `roboto`, `sourcesanspro`, `newtxtext`, and `tcolorbox`.

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

## Import notes from 2026 10 20

The working source was extracted from the supplied ZIP. Both original files and the initial public PDF copy retain their original bytes. At the user's request, this import updates the website to follow the new TeX assets and leaves the TeX source unchanged. No TeX compilation was performed; the host currently has no LaTeX compiler installed, and the public PDF remains the legacy copy.

The website now uses the source's Codeforces rating **2715** and International Grandmaster title. The undated rating is not labeled current or peak. The old PDF's different rating is superseded by the supplied TeX reference; it does not require further reconciliation for this import.
