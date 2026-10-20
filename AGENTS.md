# Jaemin Park personal website

This repository maintains Jaemin Park's website and editable TeX CV together. The site is based on al-folio.

## Sources and layout

- Keep `template/al-folio` as the unmodified upstream snapshot. Make personal changes on the site branch.
- The latest explicit user instructions and supplied assets establish personal facts. The imported TeX assets are the current reference; the old PDF is historical and must not override them. Use current project sources for project claims. Do not invent employment dates, publications, ratings, project metrics, or public demo URLs.
- Website content lives in `_data/cv.yml` (CV, awards, skills, and Codeforces information), `_pages/` (biography and page content), `_projects/` (project descriptions), and `_data/notes.yml` (notes collections). There is no separate `site-docs/` directory.
- The editable CV starts at `cv/source/resume.tex`. Its active sections are `cv/source/cv/education.tex`, `achievements.tex`, `projects.tex`, `experience.tex`, and `skills.tex`. Despite its filename, `projects.tex` contains the **research** section.
- `cv/source/russell.cls` controls the TeX presentation. Optional sections and commented examples in the imported project are template material, not additional personal accomplishments. Follow active inputs from `resume.tex`.
- Preserve the supplied ZIP and old PDF in `cv/archive/` as original snapshots. Edit `cv/source/`, not the ZIP or a PDF. `assets/pdf/cv.pdf` is the public download; its initial copy is the legacy PDF until rebuilt from TeX.
- See [CV maintenance](cv/README.md) for the file map, build commands, and import status.

## Future CV requests: update both formats

For every future CV content request, update the website sources and the corresponding TeX sections together in the same changeset. The user has authorized this workflow; do not ask whether to update the other format. Follow an explicit request to limit a particular change to one format.

1. Read the affected website entries and active TeX sections before editing. Apply the requested facts to both, including any affected homepage highlights, award listings, and project summaries.
2. Keep shared names, dates, titles, results, team names, proficiency levels, and claims consistent. The website can contain longer project descriptions and links than the printed CV. Preserve deliberate differences in scope and presentation.
3. Keep shared website facts in `_data/cv.yml` and render them from there on other pages where practical. Do not label an undated supplied rating as current or peak without evidence.
4. Keep the formats independently editable. The agreed automation is the agent making paired edits; do not introduce a data generator or PDF automation workflow unless requested.
5. After changing TeX content, rebuild and review the PDF using `cv/README.md`, then replace `assets/pdf/cv.pdf` only after a successful build. Keep temporary output in ignored `cv/build/` and leave the archived originals unchanged.
6. If compilation is unavailable or fails, retain the last valid public PDF and report that its rebuild is pending. Do not claim the downloadable PDF reflects new content. Source organization or an explicitly requested website-only update does not require a PDF rebuild.
7. Summarize the website and TeX files changed, any intentional differences, and whether the public PDF was rebuilt.

The initial import follows the user's instruction to update the website from the supplied TeX assets only. It preserves the TeX bytes and does not rebuild the legacy PDF. This exception does not change the default for future requests.

## Site implementation

- Preserve the existing notes and project site paths. The account homepage uses an empty `baseurl`.
- Keep `cv/` excluded from Jekyll output so source files, fonts, and archives are not published. The website's `/cv/` route is generated from `_pages/cv.md`. Keep public PDF links in `_pages/cv.md`, `_pages/about.md`, and `_data/socials.yml` consistent with `assets/pdf/cv.pdf`.
- Prefer content and configuration changes over runtime overrides. Consult `docs/ARCHITECTURE.md` and `docs/BOUNDARIES.md` before adding a local override of a gem-owned file; record intentional overrides with the al-folio upgrade audit.
- The site uses Ruby 3.3, Bundler 4.0.6, and the pinned gems in `Gemfile.lock`. A production Jekyll build renders the site. Use the repository's Prettier configuration for changed Markdown and YAML; preserve imported TeX and binary assets unless their content needs editing.
- `systemd/` hosts the preview on port 1111. Restart `cv-blog.service` after `_config.yml` or dependency changes; ordinary content changes rebuild automatically. Keep the requested preview service running.
- Keep credentials, authenticated preview URLs, local storage, and machine-specific service details out of public page content.
