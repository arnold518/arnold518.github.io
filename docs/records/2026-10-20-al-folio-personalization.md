# Al folio personal site implementation

Recorded: 2026-10-20

## Branches and provenance

- `template/al-folio` preserves the exact tracked tree from upstream commit `f2a2765c8a9413f6ec703fc02070fbe6becf1572` of `https://github.com/alshedivat/al-folio`.
- Template snapshot commit: `e1ffa997dd7cb3fb23ea9bf6d7db78f7d8ed71c1`.
- `site/jaemin-park` starts from that snapshot and contains the personal website.
- The snapshot retains the original site's history as its parent. The personal branch can be merged into the existing repository without combining unrelated histories.

## Personal content

The homepage introduces Jaemin Park and links to the PDF CV, full CV, awards, projects, and notes. Four selected awards appear on the homepage. All 17 competitive programming results and two research awards are stored in `_data/cv.yml` and shared with the Awards page.

The CV includes education, the Huawei research internship, Korean IOI Training Camp teaching, four research projects, programming skills, and the two software projects. The supplied PDF is preserved byte for byte at `cv/archive/CV_20240314.pdf`; its public copy is `assets/pdf/cv.pdf`. The subsequently imported editable TeX project is maintained in `cv/source/` under the workflow in `AGENTS.md`.

The user designated the new TeX assets as the current reference and requested a website-only alignment for the initial import. The website includes Codeforces rating 2715 and the International Grandmaster title from the active TeX achievements section. The Awards page renders the same shared entry as the CV. The initial import left the TeX source and legacy public PDF unchanged; the later PDF request is recorded below. Future CV requests update the website and TeX together unless explicitly limited by the user.

Reinventing the Wheel and PS Checklist each have a project page and an illustrative SVG for the project listing. Their descriptions use the current local project documentation. PS Checklist is described as a beta with a JavaScript frontend, Python services, and Supabase. Its authenticated preview address is omitted from the public site.

The **Blogs** section at `/blogs/` and on the homepage presents Problem Solving, Mathematics, and Computer Science in cards matching the Projects page. `_data/blogs.yml` provides descriptions, external destinations, repository links, and original SVG thumbnails. The new `_includes/blog_cards.liquid` reuses the existing gem-owned project card, with the same responsive grid and hover behavior. `/notes/` remains an alias without a navigation entry, and the three existing blog destinations retain their paths.

The user's portrait was moved from the supplied root-level JPEG to `assets/img/profile.jpg` and enabled in the homepage's profile front matter.

## Compiled PDF and per-push builds

`assets/pdf/cv.pdf` is now compiled from the current working TeX source with Tectonic 0.17.0. The homepage download uses this file and a descriptive download filename; the CV page and social PDF link use the same stable path. The archived old PDF and ZIP remain unchanged.

The first compilation exposed an invalid table-cell line break in education and a stray line break after the achievements table. These were corrected without changing personal facts. Table widths and section spacing were adjusted so the full CV, including skills, fits on one page. The resulting PDF was rendered and reviewed before replacing the public download.

`cv/build.sh` is the shared build entry point. It pins and checksum-verifies the compiler binary and caches the required TeX packages. The GitHub workflow compiles on every branch push except `gh-pages` and `template/al-folio`, on pull requests to `main`, and on manual runs. Its CV job uploads the `jaemin-park-cv` artifact; the dependent Jekyll job downloads that artifact before rendering the site. Successful `main` builds publish the new PDF with the site, without committing generated output back to the source branch. The Actions workflow has not been run remotely in this task.

The updated production Jekyll build completed successfully. The running port 1111 preview serves the three blog cards, the supplied portrait, and the new PDF. A PDF downloaded from that preview matches the compiled and published asset byte for byte, contains rating 2715 and the skills section, and has one page.

## Template changes

The personal branch removes sample posts, projects, people, books, papers, CV data, stock images, and sample external feeds. The raw template branch retains all upstream files. The personal branch also removes starter maintenance workflows and bundled agent discovery directories, while retaining the upstream license and technical documentation.

Customization uses content and configuration; there are no local overrides of gem-owned layouts, includes, or styles. The site uses the pinned upstream gems and an empty `baseurl` for `https://arnold518.github.io/`.

The GitHub Actions workflow builds the personal branch and `main`. Publication to `gh-pages` is restricted to `main`. Repository creation, pushes, merges, and live publication are separate from this local implementation.

## Content to review

- Update current affiliation, university dates, GPA, internship details, and any achievements after the supplied CV.
- Add a portrait if desired. The initial homepage uses a text profile.
- Add a confirmed Codeforces profile link and a date or peak label if supplied later. The displayed rating 2715 follows the user's designated TeX reference and is not labeled current or peak.
- The Reinventing the Wheel public homepage previously showed placeholder text; review its deployment before launch.

## CV import build

After the source import, the production Jekyll build completed successfully. The generated CV and Awards pages both contain the shared Codeforces rating 2715. The generated `cv/` directory contains only the website's `index.html`, with the editable source and archive excluded. The existing PDF links now use `/assets/pdf/cv.pdf`. The port 1111 preview service was restarted to apply the exclusion and is running.

No TeX build was performed. The validation below records the earlier site implementation checks; those checks were not rerun for this content import.

## Initial site validation

- The production Jekyll build passed using the pinned dependencies in a Ruby 3.3 Docker container. The host Ruby installation lacks development headers, so validation used the container instead.
- The repository-wide Prettier check and upstream starter style contract passed.
- The al-folio upgrade audit reported zero blocking and zero nonblocking findings. The override audit found no local files shadowing gem-owned runtime files.
- All seven content routes returned HTTP 200 at desktop width 1440 and mobile width 390. Browser review found no horizontal overflow, broken images, JavaScript exceptions, or failed local asset requests.
- Mobile navigation and project cards opened the expected pages. Keyboard search found PS Checklist and navigated to its project page; the theme control cycled through light and dark modes.
- All 191 local page links and asset references in the generated HTML resolved to existing files. The two project card GitHub buttons use absolute source repository URLs.
- The rendered award tables contain 17 competitive programming entries and two research awards. The research entries appear in the CV, and the sample Einstein identity is absent from generated pages.
- Both the source and generated CV PDF match the supplied file byte for byte. The template branch's tracked tree matches the recorded upstream commit exactly.

These checks cover the local static site. GitHub Actions and live publication have not been run. The retained notebook plugin emits a warning that optional notebook rendering needs nbconvert; this site has no notebook posts.
