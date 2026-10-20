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
- `cv/source/`: the editable TeX CV project, including `resume.tex`, section files, fonts, and `russell.cls`.
- `cv/archive/`: the original supplied ZIP and PDF, retained as historical snapshots.
- `assets/pdf/cv.pdf`: the downloadable CV, linked by the CV page and contact navigation; currently the legacy PDF pending a rebuild from TeX.
- `_config.yml`: site settings, with an empty `baseurl` for the account homepage.

The existing notes sites are linked at `/ps-notes/`, `/math-notes/`, and `/cs-notes/`.

For CV changes, the agent updates the website content and TeX source together under [AGENTS.md](AGENTS.md). The formats remain independently editable; there is no generator translating one into the other. See [CV maintenance](cv/README.md) for source layout, PDF build commands, and the import notes.

The supplied TeX assets are the current reference. For this import, the website follows those assets while the TeX and legacy PDF remain unchanged, as requested.

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

## Hosted preview on port 1111

Install or refresh the user service:

```bash
./systemd/install.sh
```

The service runs Jekyll in Docker with live rebuilding. It uses a persistent dependency cache at `~/.cache/cv-blog/gems` and generates preview output in the user runtime directory. Docker and `/usr/bin/node` are required. The initial start installs any missing gems.

```bash
systemctl --user status cv-blog.service
systemctl --user restart cv-blog.service
systemctl --user stop cv-blog.service
journalctl --user -u cv-blog.service -f
```

Open <http://localhost:1111/absproxy/1111/>. The preview's `/absproxy/1111` prefix supports the existing host proxy; the published GitHub Pages site keeps an empty `baseurl`.

After editing content, refresh the browser to see the rebuilt page. Restart the service after changing `_config.yml`, `Gemfile`, or `Gemfile.lock`.

In shells without the user session environment, prefix `systemctl` and `journalctl` commands with `XDG_RUNTIME_DIR=/run/user/$(id -u) DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus`. The installer sets these automatically.

## GitHub Pages

The workflow builds pushes to `main` and `site/jaemin-park`, pull requests to `main`, and manual runs. Only pushes or manual runs on `main` publish the built site to `gh-pages`.

1. Push the template and personal branches:

   ```bash
   git push -u origin template/al-folio
   git push -u origin site/jaemin-park
   ```

2. Merge the reviewed personal branch into `main` and push it:

   ```bash
   git switch main
   git merge --ff-only site/jaemin-park
   git push origin main
   ```

3. In the repository's **Actions** tab, wait for **Build and deploy site** to succeed. This creates or updates `gh-pages` with the generated website.
4. In **Settings → Pages → Build and deployment**, select **Deploy from a branch**, choose **gh-pages** and **/(root)**, then save. This matches the current workflow, which commits the built site to a branch. See the [GitHub publishing source guide](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-from-a-branch).
5. Visit <https://arnold518.github.io/> after GitHub finishes the Pages deployment. Later pushes to `main` rebuild and publish automatically.

If `main` advances independently, merge its updates into the personal branch before the fast-forward step. The al-folio template branch remains the baseline for comparison.

## Records

- [CV blog plan and template research](docs/records/2026-10-19-cv-blog-plan.md)
- [Personalization record](docs/records/2026-10-20-al-folio-personalization.md)

The original al-folio MIT license is retained in [LICENSE](LICENSE).
