# Jaemin Park

Personal CV and project website at https://arnold518.github.io/, built with [al-folio](https://github.com/alshedivat/al-folio).

## Branches

- `template/al-folio`: an unmodified snapshot of upstream al-folio at `f2a2765c8a9413f6ec703fc02070fbe6becf1572`. Its tracked tree matches upstream exactly.
- `site/jaemin-park`: the personalized website, based on the template branch.
- `main`: the original site history; the personal branch can be reviewed before merging.

## Content

- `_pages/about.md`: homepage and biography.
- `_data/cv.yml`: education, experience, research, projects, skills, and awards. Awards are also used by the homepage and awards page; `selected: true` selects homepage highlights.
- `_projects/`: Reinventing the Wheel and PS Checklist.
- `_data/notes.yml`: the three notes collections, shared by the homepage and Notes page.
- `CV_20240314.pdf`: the supplied PDF, linked by the CV page and contact navigation.
- `_config.yml`: site settings, with an empty `baseurl` for the account homepage.

The existing notes sites are linked at `/ps-notes/`, `/math-notes/`, and `/cs-notes/`.

## Local development

Use Ruby 3.3 with development headers and Bundler 4.0.6, plus Node.js 20 or newer for formatting and JavaScript tooling:

```bash
bundle install
npm ci
bundle exec jekyll serve
```

Open http://localhost:4000/. Build the static site with:

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

The upstream [Docker instructions](docs/INSTALL.md#local-setup-using-docker-recommended) are another option.

## GitHub Pages

The workflow builds pushes to `main` and `site/jaemin-park`, pull requests to `main`, and manual runs. Only pushes or manual runs on `main` publish the built site to `gh-pages`. To publish after review, merge the personal branch into `main` and select `gh-pages` as the Pages publishing branch.

## Records

- [CV blog plan and template research](docs/records/2026-10-19-cv-blog-plan.md)
- [Personalization record](docs/records/2026-10-20-al-folio-personalization.md)

The original al-folio MIT license is retained in [LICENSE](LICENSE).
