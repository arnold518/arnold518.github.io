---
layout: page
title: PS Checklist
permalink: /projects/ps-checklist/
description: A contest and practice tracker for competitive programming, with problem progress, contest resources, and a dated practice history.
img: assets/img/ps-checklist.svg
importance: 2
category: tools
github: https://github.com/arnold518/ps-checklist
---

[Source code](https://github.com/arnold518/ps-checklist)

**Status:** Beta, under active development.

## Organize competitive programming practice

PS Checklist brings programming contests, problem resources, and practice records into one workspace. It helps answer which contests to work on, which problems are complete, and what has been practiced over time.

## Main features

- **Contest collections:** browse ICPC and Olympiad catalogs, with separate Codeforces and AtCoder collections for imported contests.
- **Problem progress:** track status across contests, with shared progress when the same problem appears in more than one collection.
- **Contest resources:** open judge links, statements, editorials, and other materials from contest and problem details.
- **Practice history:** record practice dates, revisit sessions in a timeline, and manage individual practice records.
- **Catalog curation:** fetch contest information, review drafts, and publish selected resources through an administration workflow.

## Implementation

The current beta uses a JavaScript frontend, Python services for fetching and catalog operations, and Supabase for account and user data. The interface combines a collapsible contest tree, problem grids, detail panels, and a practice timeline, with contest cards on small screens.

The [repository](https://github.com/arnold518/ps-checklist) contains the implementation and development instructions.
