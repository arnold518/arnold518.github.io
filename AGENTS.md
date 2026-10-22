# Jaemin Park personal website

This repository maintains Jaemin Park's website and editable TeX CV together. The site is based on al-folio.

## Sources and layout

- Keep `template/al-folio` as the unmodified upstream snapshot. Make personal changes on the site branch.
- The latest explicit user instructions and supplied assets establish personal facts. The imported TeX assets are the current reference; the old PDF is historical and must not override them. Use current project sources for project claims. Do not invent employment dates, publications, ratings, project metrics, or public demo URLs.
- Website content lives in `_data/cv.yml` (CV, awards, skills, and Codeforces information), `_pages/` (biography and page content), `_projects/` (project descriptions), and `_data/blogs.yml` (the three external blogs). There is no separate `site-docs/` directory.
- The web CV uses `layout: default` in `_pages/cv.md`, the site-owned `_includes/cv_profile.liquid` with date and award helpers, and scoped styles in `assets/css/cv.css`. Keep personal facts in `_data/cv.yml`; research entries use `title`, `date`, and `highlights`. Preserve the document layout, labeled PDF download, grouped award history, and responsive section navigation when updating content. The generic `layout: cv` renderer does not provide this presentation.
- Keep both CVs in this section order: **Education → Achievements → Experience → Projects → Research → Skills**. The website labels its awards section Achievements while preserving its `#awards` anchor and the `Awards` data key; its section navigation follows the same order. The PDF places Education, Achievements, Experience, and Projects on page one, with Research and Skills on page two.
- The editable CV starts at `cv/source/resume.tex`. Its active sections are `cv/source/cv/education.tex`, `achievements.tex`, `projects.tex`, `software-projects.tex`, `experience.tex`, and `skills.tex`. Despite its filename, `projects.tex` contains the **research** section. Software project descriptions live in `software-projects.tex` and correspond to `cv.sections.Projects` in `_data/cv.yml` and the related `_projects/` pages.
- `cv/source/russell.cls` controls the TeX presentation. Optional sections and commented examples in the imported project are template material, not additional personal accomplishments. Follow active inputs from `resume.tex`.
- Preserve the supplied ZIP and old PDF in `cv/archive/` as original snapshots. Edit `cv/source/`, not the ZIP or a PDF. `assets/pdf/cv.pdf` is the public download compiled from the working TeX source.
- See [CV maintenance](cv/README.md) for the file map, build commands, and import status.

## Future CV requests: update both formats

For every future CV content request, update the website sources and the corresponding TeX sections together in the same changeset. The user has authorized this workflow; do not ask whether to update the other format. Follow an explicit request to limit a particular change to one format.

**Persistent exceptions:** Preserve these differences during future CV updates; include the omitted entries in the PDF again only if the user explicitly requests it.

- PS Checklist stays in the website CV and project pages but is excluded from the TeX CV and compiled PDF.
- Google Code Jam 2021 (Round 3, 196th place) and Google Kick Start 2020 (Round B, 28th place) stay in the website CV and Awards page but are excluded from the TeX CV and compiled PDF.

1. Read the affected website entries and active TeX sections before editing. Apply the requested facts to both, including any affected homepage highlights, award listings, and project summaries.
2. Keep shared names, dates, titles, results, team names, proficiency levels, and claims consistent. The website can contain longer project descriptions and links than the printed CV. Preserve deliberate differences in scope and presentation.
3. Keep shared website facts in `_data/cv.yml` and render them from there on other pages where practical. Do not label an undated supplied rating as current or peak without evidence.
4. Keep the formats independently editable. Content synchronization is performed by the agent making paired edits. PDF compilation is automated in `.github/workflows/deploy.yml`; this does not generate or synchronize the TeX and website content.
5. After changing TeX content, rebuild with `./cv/build.sh` and review the PDF using `cv/README.md`, then replace `assets/pdf/cv.pdf` only after a successful build. The script pins Tectonic and downloads its binary with a checksum check. CI uses the same script, uploads the PDF artifact, and passes that fresh artifact to the site build. Keep temporary output in ignored `cv/build/` and leave the archived originals unchanged.
6. If compilation is unavailable or fails, retain the last valid public PDF and report that its rebuild is pending. Do not claim the downloadable PDF reflects new content. Source organization or an explicitly requested website-only update does not require a PDF rebuild.
7. Summarize the website and TeX files changed, any intentional differences, and whether the public PDF was rebuilt.

Shared award titles in `_data/cv.yml` must match the bold award titles in `cv/source/cv/achievements.tex`, including full ICPC names and years. In the PDF, preserve the established competitive programming order with ICPC World Finals first; keep research and hackathon awards in a separate group, newest year first. The 2026 Nexon Young Programmers Cup Master Track and Korea Quantum Information Competition belong to **Research & Hackathon Awards** (`research-hackathon`), alongside Samsung Humantech. Use the approved quantum result **Director’s Award (3rd place)** without the awarding center or team name.

Use title case for website CV/Awards headings, shared research titles, and award result labels such as **Bronze Prize**, **Bronze Medal**, **Champion**, and **Director’s Award**. Rankings use lowercase **place**, including in parentheses: **Bronze Prize (9th place)**. The PDF keeps its uppercase main headings as typography and follows the same wording/case rules for entries. Preserve official names, acronyms, and team casing such as **ICPC**, **RV32I**, **NewTrend**, and **aespa**. Descriptive prose uses sentence case. Keep shared award result capitalization and rank formatting consistent across both CVs and the Awards page.

The initial import updated only the website from the supplied TeX assets at the user's request. The subsequent PDF build replaced the public legacy copy. See `cv/README.md` for that history; the default for future requests is paired content editing.

## Site implementation

- Preserve the existing notes and project site paths. The account homepage uses an empty `baseurl`.
- The public section is named **Blogs** at `/blogs/`; `/notes/` remains a hidden navigation alias. Its data uses `redirect` for each external destination, `github` for its source repository, and `img` for its thumbnail. `_includes/blog_cards.liquid` reuses the gem's `projects.liquid` card without overriding it; use the shared include on the Blogs pages. The homepage has text links to the three blogs and no blog cards.
- The homepage lives in `_pages/about.md`, retains the gem's `about` layout and supplied portrait, and uses scoped styles in `assets/css/home.css`. Its award, education, and experience labels read from `_data/cv.yml`; project titles and introductions read from `_projects/`.
- The supplied personal portrait is `assets/img/profile.jpg`, enabled through the homepage's `profile` front matter. The unused image in the imported TeX template is not the website portrait.
- Keep `cv/` excluded from Jekyll output so source files, fonts, and archives are not published. The website's `/cv/` route is generated from `_pages/cv.md`. Keep public PDF links in `_pages/cv.md`, `_pages/about.md`, and `_data/socials.yml` consistent with `assets/pdf/cv.pdf`.
- Prefer content and configuration changes over runtime overrides. Consult `docs/ARCHITECTURE.md` and `docs/BOUNDARIES.md` before adding a local override of a gem-owned file; record intentional overrides with the al-folio upgrade audit.
- The site uses Ruby 3.3, Bundler 4.0.6, and the pinned gems in `Gemfile.lock`. A production Jekyll build renders the site. Use the repository's Prettier configuration for changed Markdown and YAML; preserve imported TeX and binary assets unless their content needs editing.
- `systemd/` hosts the preview on port 1111. Restart `cv-blog.service` after `_config.yml` or dependency changes; ordinary content changes rebuild automatically. Keep the requested preview service running.
- Keep credentials, authenticated preview URLs, local storage, and machine-specific service details out of public page content.
