---
layout: about
title: About
permalink: /
subtitle: Computer Science and Engineering · Seoul National University
profile:
  align: right
  image: profile.jpg
  image_circular: false
selected_papers: false
social: false
announcements:
  enabled: false
latest_posts:
  enabled: false
---

I study computer science and engineering at Seoul National University. My interests span algorithms and data structures, computer systems, and machine learning.

I competed with **NewTrend**, winning a **bronze medal at the 48th ICPC World Finals** and the **2024 ICPC Asia Pacific Championship**. I also build software and write notes to explore how things work, from digital logic and processors to algorithms and mathematics.

[CV]({{ '/cv/' | relative_url }}) · <a href="{{ '/assets/pdf/cv.pdf' | relative_url }}" download="Jaemin-Park-CV.pdf">Download PDF</a> · [GitHub](https://github.com/arnold518) · [Email](mailto:arnoldpark03@gmail.com)

## Selected achievements

{% assign selected_awards = site.data.cv.cv.sections.Awards | where: 'selected', true %}
{% for award in selected_awards %}
- **{{ award.date }} · {{ award.title }}** — {{ award.summary }}
{% endfor %}

[All awards and results →]({{ '/awards/' | relative_url }})

## Projects

{% assign projects = site.projects | sort: 'importance' %}
{% for project in projects %}
### [{{ project.title }}]({{ project.url | relative_url }})

{{ project.description }}

{% endfor %}

## Blogs

I write about problem solving, mathematics, and computer science, from contest solutions and proofs to papers I am reading.

{% include blog_cards.liquid %}

## Experience and research

I was a **research intern at Huawei's Hong Kong Research Center in 2025** and a **teaching assistant at the Korean IOI Training Camp from 2021 to 2024**. My earlier research explored geometric data structures, dynamic programming optimization, and reinforcement learning for graph games.

[Education, experience, and research →]({{ '/cv/' | relative_url }})
