# Jaemin Park CV Blog Plan and Template Research

Recorded: 2026-10-19

Status: al-folio selected; personal site implementation recorded on 2026-10-20

Create a personal website at `https://arnold518.github.io/` that introduces Jaemin Park, presents competitive programming achievements and research experience, showcases projects such as Reinventing the Wheel and PS Checklist, and connects readers to ps-notes, math-notes, and cs-notes.

**Recommended starting point: al-folio**, adapted to the quiet academic style of [Junseo Lee's website](https://harris-junseo-lee.github.io/). Its [repository metadata](https://github.com/harris-junseo-lee/harris-junseo-lee.github.io) identifies al-folio as its original template. Use the upstream template and make awards, projects, and notes prominent in the homepage layout.

## Requested content and site structure

The homepage should give a quick overview, with dedicated pages for the longer CV, award history, and project descriptions. The existing notes sites should have clear links from the homepage and navigation.

| Destination                        | Proposed content                                                                                                                 |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `/`                                | Name, optional portrait, short introduction, email, GitHub, PDF CV, selected awards, featured project, and the three notes sites |
| `/cv/`                             | Education, experience, research, teaching, skills, and a PDF download                                                            |
| `/awards/`                         | Complete competitive programming results, with research awards identified separately                                             |
| `/projects/`                       | Selected projects with a description, contribution, technical details, source, and demo or documentation links                   |
| `/projects/reinventing-the-wheel/` | A fuller description of CircuitSim, its architecture, and an interactive example                                                 |
| `/notes/`                          | Introductions and links to ps-notes, math-notes, and cs-notes                                                                    |
| `/blog/`                           | Optional future posts about projects, research, or contest experiences                                                           |

Suggested navigation: **About · CV · Awards · Projects · Notes**. Add Blog when there is an initial post. Research and teaching can begin within the CV and gain their own pages as material grows.

### Homepage layout

1. **Profile:** Jaemin Park, a short biography, optional portrait, and links to CV, email, and GitHub.
2. **Selected achievements:** ICPC World Finals bronze medal, ICPC Asia Pacific championship, ICPC Hue City championship, and SCPC second prize.
3. **Featured project:** Reinventing the Wheel, with a short explanation and links to code and the simulator.
4. **Notes:** Three equally visible entries for Problem Solving Notes, Mathematics Notes, and Computer Science Notes.
5. **Experience and research:** A short selection linking to the full CV.
6. **News:** Optional dated announcements when there are updates to maintain.

Use a restrained accent color, readable text, generous spacing, and compact lists similar to the reference. Prefer text for award history and a small number of project cards. The layout should work on phones, support keyboard navigation, and handle mathematical notation and code in future posts.

Working assumptions: English for the profile and CV; original languages retained in linked notes; public contact through email and GitHub. Current affiliation and the introduction need a fresh author update before launch.

## Content inventory from the supplied CV

Source: [CV_20240314.pdf](../../CV_20240314.pdf). The PDF contains entries through 2025, so its filename does not establish its revision date. The entries below preserve the supplied information; time-sensitive details need review before publication.

### Profile and education

| Field               | CV content                                                                              | Publication follow-up                 |
| ------------------- | --------------------------------------------------------------------------------------- | ------------------------------------- |
| Name                | Jaemin Park                                                                             | Use as the site title                 |
| GitHub              | [arnold518](https://github.com/arnold518)                                               | Link from the profile                 |
| Email               | arnoldpark03@gmail.com                                                                  | Confirm preferred public address      |
| University          | Seoul National University, Department of Computer Science and Engineering, 2022–Current | Update current status and dates       |
| University GPA      | 3.47 / 4.3; major GPA 3.77 / 4.3                                                        | Refresh if including GPA              |
| Secondary education | Gyeonggi Science High School, 2019–2021; GPA 4.03 / 4.3                                 | Include in the full CV as appropriate |

### Competitive programming prizes and results

Keep both the result and team name where supplied. Distinguish a numbered prize from a contest placing: for example, SCPC's second prize should retain that wording.

| Year | Competition                                                         | Result                  | Team     |
| ---- | ------------------------------------------------------------------- | ----------------------- | -------- |
| 2024 | 48th ICPC World Finals                                              | 9th place, bronze medal | NewTrend |
| 2024 | ICPC Asia Pacific Championship                                      | 1st place, champion     | NewTrend |
| 2024 | ICPC Asia Seoul Regional                                            | 10th place              | aespa    |
| 2023 | ICPC Asia Hue City Regional                                         | 1st place, champion     | NewTrend |
| 2023 | ICPC Asia Seoul Regional                                            | 3rd place               | NewTrend |
| 2023 | Samsung Collegiate Programming Cup                                  | 2nd prize               | —        |
| 2022 | ICPC Asia Seoul Regional                                            | 4th place               | NewTrend |
| 2022 | Samsung Collegiate Programming Cup                                  | 4th prize               | —        |
| 2021 | Korean selection test for the International Olympiad in Informatics | 6th place               | —        |
| 2021 | Korean Olympiad in Informatics                                      | Silver prize, 6th place | —        |
| 2021 | Nexon Youth Programming Challenge                                   | Bronze prize, 4th place | —        |
| 2021 | Google Code Jam, Round 3                                            | 196th place             | —        |
| 2021 | Reply Code Challenge, Teen Edition                                  | 4th place               | —        |
| 2020 | Korean Olympiad in Informatics                                      | Silver prize, 5th place | —        |
| 2020 | Nexon Youth Programming Challenge                                   | Bronze prize, 8th place | —        |
| 2020 | Google Kick Start, Round B                                          | 28th place              | —        |
| 2019 | Korean Olympiad in Informatics                                      | Silver prize            | —        |

The CV also lists **Codeforces rating 2610, International Grandmaster**. Confirm the profile URL and whether 2610 is a historical, maximum, or current rating before choosing the public label. Add official standings or award links to individual entries during content preparation.

### Research awards

| Year | Award                                                        | Result       |
| ---- | ------------------------------------------------------------ | ------------ |
| 2021 | Samsung Humantech Paper Award, Mathematics / Data Processing | Gold prize   |
| 2020 | Samsung Humantech Paper Award, Mathematics / Data Processing | Bronze prize |

### Research and experience

The CV contains four research projects. Present them as research projects; add publication details only when a venue or paper link is available.

| Year | Research project                                                                       | Summary from the CV                                                                                                                     |
| ---- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| 2021 | Data Structure for Maintaining Kth Maximum / Minimum Element of Polynomial Functions   | Modified Quad Tree and Persistent Angular Sorting for maintaining order statistics of functions; generalization to polynomial functions |
| 2020 | Competitive Reinforcement Learning for Graph Coloring Games                            | A two-player graph game and reinforcement learning experiments using DQN, DDQN, and D3QN                                                |
| 2020 | New Algorithm for Maintaining Lower/Upper Envelope of Similar Convex Figures           | Extensions of Li Chao trees to quadratic functions and similar convex figures                                                           |
| 2019 | New Techniques for Dynamic Programming Optimization using Convex Hull and Segment Tree | Dynamic convex hulls with splay trees, Quad Li Chao trees, and segment trees containing convex hulls                                    |

Experience to include:

- **2025:** Research Intern, Huawei Technologies, Hong Kong Research Center. Add exact dates and a suitable description of the work.
- **2021–2024:** Teaching Assistant, Korean IOI Training Camp. The CV describes teaching algorithms to more than 50 candidates for the Korean IOI delegation.

The CV lists C/C++, Java, Python, and Scala with proficiency levels. Refresh the skills section alongside the current education and experience information.

## Projects and existing notes sites

### Reinventing the Wheel

Feature [Reinventing the Wheel](https://github.com/arnold518/reinventing-the-wheel) as the first project. Its current local documentation describes **CircuitSim**, a digital logic simulator that builds from gates through arithmetic, memory, and RV32I processors. It includes single-cycle and pipelined cores, timing experiments, and an interactive simulator.

Suggested project summary, based on the current repository documentation:

> A digital logic simulator that builds a computer from gates to RV32I processors, with interactive circuit examples and documentation of component structure, behavior, and timing.

The project page should explain the motivation, personal contribution, implementation language and architecture, and one example a visitor can run. Use a real simulator image or interaction to illustrate the work. Describe implemented features separately from future plans, and attach measurements to a specific result and revision when including them.

Useful destinations:

- [Source code](https://github.com/arnold518/reinventing-the-wheel)
- [Documentation homepage](https://arnold518.github.io/reinventing-the-wheel/)
- [Simulator destination](https://arnold518.github.io/reinventing-the-wheel/simulator/) — linked from the current local documentation; check this route during implementation.

The public documentation homepage returned HTTP 200 during research but displayed placeholder text. The local `site-docs/index.md` contains a fuller introduction. Reconcile the deployed introduction before featuring the documentation link at launch.

### PS Checklist

Include [PS Checklist](https://github.com/arnold518/ps-checklist) as a featured project alongside Reinventing the Wheel. The current beta organizes contest collections, problem progress, resources, and dated practice records. Its current implementation uses a JavaScript frontend, Python services, and Supabase. Link to the source repository; the current authenticated preview is intended for development.

### Notes hub

| Site                                                            | Homepage description                                                                                     | Source                                                           |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| [Problem Solving Notes](https://arnold518.github.io/ps-notes/)  | Competitive programming solutions, algorithms and data structures, techniques, and contest study records | [ps-notes repository](https://github.com/arnold518/ps-notes)     |
| [Mathematics Notes](https://arnold518.github.io/math-notes/)    | Notes on linear algebra, abstract algebra, mathematical statistics, and topology                         | [math-notes repository](https://github.com/arnold518/math-notes) |
| [Computer Science Notes](https://arnold518.github.io/cs-notes/) | Paper reviews and study notes covering deep learning, reinforcement learning, and quantum computation    | [cs-notes repository](https://github.com/arnold518/cs-notes)     |

The local configurations use MkDocs Material. Link to these sites from the new homepage and Notes page, preserving their existing URLs. A few manually selected articles can provide entry points. Automated feeds can follow if there is a useful, consistent feed to consume.

## Template comparison

The following are open source options with MIT licenses in their upstream repositories. The fit and customization assessments are judgments for this website's requested content. Demo links allow visual comparison before choosing a template.

| Template             | Demo and source                                                                                                                                                                   | Relevant strengths                                                                                | Work needed for this site                                                               |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| **al-folio**         | [Demo](https://alshedivat.github.io/al-folio/) · [Source](https://github.com/alshedivat/al-folio)                                                                                 | Academic profile, structured CV, project pages, posts, mathematical content, light and dark modes | Add a dedicated awards page and notes hub; simplify the default navigation and homepage |
| **as-folio**         | [Demo](https://dadangnh.github.io/as-folio/) · [Source](https://github.com/dadangnh/as-folio)                                                                                     | Astro academic portfolio with CV, projects, Markdown/MDX posts, math, and search                  | Add awards and notes pages; configure the root deployment path and trim demo sections   |
| **Academic Pages**   | [Demo](https://academicpages.github.io/) · [Source](https://github.com/academicpages/academicpages.github.io)                                                                     | Academic profile sidebar, CV, portfolio, blog, and research collections                           | Adapt academic sections to awards and projects; style a more compact homepage           |
| **Minimal Mistakes** | [Demo](https://mmistakes.github.io/minimal-mistakes/) · [Starter](https://github.com/mmistakes/mm-github-pages-starter) · [Source](https://github.com/mmistakes/minimal-mistakes) | Flexible Jekyll pages, posts, and collections; remote theme option for GitHub Pages               | Build the CV, awards presentation, and project structure from general layouts           |
| **AstroPaper**       | [Demo](https://astro-paper.pages.dev/) · [Source](https://github.com/satnaing/astro-paper)                                                                                        | Minimal Astro blog with Markdown content, search, and light and dark modes                        | Build the CV and project sections and change the homepage to emphasize the profile      |
| **Chirpy**           | [Demo](https://chirpy.cotes.page/) · [Source](https://github.com/cotes2020/jekyll-theme-chirpy)                                                                                   | Technical posts, categories, search, math, code highlighting, and diagrams                        | Create CV, awards, projects, and notes pages; adapt the default post listing            |

### Recommended choice

**Choose al-folio for the closest starting point to the supplied reference.** Its [CV demo](https://alshedivat.github.io/al-folio/cv/) and [projects demo](https://alshedivat.github.io/al-folio/projects/) cover two central sections. Use the homepage primarily for the introduction, selected achievements, featured work, and notes links.

The current upstream uses a v1 starter with functionality supplied by versioned Ruby plugins. Pin dependencies and follow its current setup instructions, since older tutorials may describe a different layout. See the [upstream README](https://github.com/alshedivat/al-folio) and [installation guide](https://github.com/alshedivat/al-folio/blob/main/docs/INSTALL.md).

**Choose as-folio if Astro and TypeScript are preferred.** It provides a similar academic content model, including structured CV data and project collections. Its current README lists Node 24+ and deployment configuration through `ASTRO_SITE` and `ASTRO_BASE`. Check the toolchain and configuration at the chosen revision. See the [as-folio setup instructions](https://github.com/dadangnh/as-folio#getting-started).

**Choose Academic Pages if the persistent profile sidebar is preferred.** It already organizes the kinds of content needed for an academic CV. Its maintainers note that applying upstream changes to a customized copy can require conflict resolution. See the [overview](https://academicpages.github.io/) and [maintenance notes](https://github.com/academicpages/academicpages.github.io#bugfixes-and-enhancements).

Minimal Mistakes offers more freedom at the cost of building more CV structure; its [quick start guide](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/) documents the GitHub Pages remote theme option. AstroPaper and Chirpy become stronger choices if regular articles become the main focus of the site.

## Implementation outline

1. Choose the template and review current biography, affiliation, CV dates, contact details, and Codeforces information. Select a portrait if desired.
2. Bring the chosen upstream starter into this repository at a recorded revision, preserving the supplied CV and this planning record. Retain the upstream license notices.
3. Configure the site root as `https://arnold518.github.io/`. For al-folio, set `url` to that origin and `baseurl` to an empty string, as documented in its [installation guide](https://github.com/alshedivat/al-folio/blob/main/docs/INSTALL.md#important-notes-for-github-pages-sites).
4. Create the profile, full CV, awards, projects, and notes content. Keep award entries and project metadata in structured data so homepage selections and full lists can share the same source.
5. Replace the current `index.html` redirect with the profile homepage. Preserve `/ps-notes/`, `/math-notes/`, `/cs-notes/`, and `/reinventing-the-wheel/` as destinations belonging to their existing repositories.
6. Preview locally and review desktop and mobile layouts, navigation, PDF download, mathematical content, and external links. Confirm that the deployed project introduction is suitable to feature.
7. Configure GitHub Pages according to the chosen starter's workflow. The current al-folio guide describes an Actions build publishing a `gh-pages` branch; Academic Pages and as-folio document GitHub Actions as the Pages source. Follow the workflow at the selected revision. For an Astro implementation, see the [official GitHub Pages deployment guide](https://docs.astro.build/en/guides/deploy/github/).

### Launch checklist

- [ ] The root homepage introduces Jaemin Park and provides a working CV download.
- [ ] Selected PS achievements appear on the homepage; the full history has a dedicated page.
- [ ] Dates, affiliation, award wording, and Codeforces information have been reviewed.
- [ ] Reinventing the Wheel and PS Checklist have substantive project descriptions and useful source links; the simulator is linked for Reinventing the Wheel.
- [ ] All three notes sites are easy to reach and retain their existing paths.
- [ ] Sample identities, sample projects, and unused navigation entries have been removed.
- [ ] The chosen template builds successfully and the desktop and mobile layouts have been reviewed.
- [ ] The deployed homepage and linked destinations work after publication.

## Source notes

The personal content inventory comes from the supplied PDF. Project and notes descriptions also use the current neighboring repositories, especially `reinventing-the-wheel/site-docs/index.md` and the four `mkdocs.yml` files. These descriptions reflect their source content rather than a claim that every documented feature is present on the deployed sites.

Template research uses the linked upstream repositories, official demos, and setup guides, accessed on 2026-10-19. The linked math-notes, cs-notes, and Reinventing the Wheel homepages returned HTTP 200 through direct requests; ps-notes was also accessible through the browser tool. These requests establish reachability, while visual review and template build validation belong to implementation.
