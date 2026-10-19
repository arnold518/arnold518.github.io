# Jaemin Park personal website

This repository is a personal site created from al-folio, not the upstream starter repository.

- Keep `template/al-folio` as the unmodified upstream snapshot. Make personal content changes on the site branch.
- The supplied CV and current project sources establish personal claims. Do not invent employment dates, publications, ratings, project metrics, or public demo URLs.
- Edit `_data/cv.yml` for CV content and awards, `_data/notes.yml` for notes collections, and `_projects/` for project descriptions.
- Preserve the existing notes and project site paths. The account homepage uses an empty `baseurl`.
- Prefer content and configuration changes over runtime overrides. Consult `docs/ARCHITECTURE.md` and `docs/BOUNDARIES.md` before adding a local override of a gem-owned file; record intentional overrides with the al-folio upgrade audit.
- The current site uses Ruby 3.3, Bundler 4.0.6, and the pinned gems in `Gemfile.lock`. A production Jekyll build is the primary implementation check. Use the repository's Prettier configuration when formatting changed content.
- Keep credentials, authenticated preview URLs, local storage, and machine-specific service details out of the public site.
