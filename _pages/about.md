---
layout: about
title: About
permalink: /
subtitle: Computer Science and Engineering · Seoul National University
description: Algorithms, computer systems, and projects by Jaemin Park at Seoul National University.
cv_pdf: /assets/pdf/cv.pdf
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

<link rel="stylesheet" href="{{ '/assets/css/home.css' | relative_url | bust_file_cache }}">

{% assign cv = site.data.cv.cv %}
{% assign education = cv.sections.Education | first %}
{% assign selected_awards = cv.sections.Awards | where: 'selected', true %}
{% assign projects = site.projects | sort: 'importance' %}

<div class="home-profile">
  <div class="home-intro">
    <p>
      I'm a {{ education.area | downcase | escape }} student at <strong>{{ education.institution | escape }}</strong>.
      My interests span algorithms and data structures, computer systems, and machine learning.
    </p>
    <p>
      My work ranges from geometric data structures and compiler optimization to hardware simulation. I build tools that make the behavior of
      processors, memory, and I/O devices observable, and help organize competitive programming practice.
    </p>
    <nav class="home-links" aria-label="Profile links">
      <a class="home-cv-link" href="{{ '/cv/' | relative_url }}">View CV</a>
      <a href="{{ page.cv_pdf | relative_url }}" download="Jaemin-Park-CV.pdf">Download CV (PDF)</a>
      <a href="https://github.com/{{ site.data.socials.github_username | escape }}">GitHub</a>
      <a href="mailto:{{ cv.email | escape }}">Email</a>
    </nav>
  </div>

  <section class="home-section" aria-labelledby="home-achievements">
    <h2 id="home-achievements">Selected Achievements</h2>
    <ul class="home-awards" role="list">
      {% for award in selected_awards %}
        <li>
          <span class="home-date">{{ award.date | escape }}</span>
          <div>
            <h3>{{ award.title | escape }}</h3>
            <p>{{ award.summary | escape }}</p>
          </div>
        </li>
      {% endfor %}
    </ul>
    {% for entry in cv.sections['Competitive Programming'] %}
      <p class="home-distinction"><strong>{{ entry.label | escape }}:</strong> {{ entry.details | escape }}</p>
    {% endfor %}
    <a class="home-more" href="{{ '/awards/' | relative_url }}">All awards and results <span aria-hidden="true">→</span></a>
  </section>

  <section class="home-section" aria-labelledby="home-experience">
    <h2 id="home-experience">Experience</h2>
    {% for entry in cv.sections.Experience %}
      <div class="home-entry">
        <div class="home-entry-heading">
          <h3>{{ entry.company | escape }}</h3>
          <span class="home-date">{% include cv_dates.liquid entry=entry %}</span>
        </div>
        <p class="home-role">{{ entry.position | escape }}</p>
        {% if entry.company == 'Huawei Technologies Co., Ltd. — Hong Kong Research Center' %}
          <p>
            Worked on an LLVM-based C++ framework for tensor computation graphs, contributing a compiler optimization pass and a DAG analysis
            tool based on flow algorithms.
          </p>
        {% else %}
          <p>{{ entry.highlights | first | escape }}</p>
        {% endif %}
      </div>
    {% endfor %}
  </section>

  <section class="home-section" aria-labelledby="home-projects">
    <h2 id="home-projects">Projects</h2>
    {% for project in projects %}
      <article class="home-entry">
        <h3><a href="{{ project.url | relative_url }}">{{ project.title | escape }}</a></h3>
        <p>{{ project.description | escape }}</p>
        {% if project.permalink == '/projects/reinventing-the-wheel/' %}
          <p>
            The platform brings together ALUs, flip-flop/SRAM/DRAM memory models, caches, and RV32I/RV32IM processors. An event-driven C++20 engine
            combines structural and behavioral models with gate-derived delay tables and graph-based computation of safe clock periods.
          </p>
        {% endif %}
        <div class="home-project-links">
          <a href="{{ project.url | relative_url }}">Project details <span aria-hidden="true">→</span></a>
          <a href="{{ project.github | escape }}">Source code</a>
        </div>
      </article>
    {% endfor %}
  </section>

  <section class="home-section" aria-labelledby="home-research">
    <h2 id="home-research">Research</h2>
    <p>
      My earlier research explored geometric data structures for maintaining function order statistics and envelopes, dynamic programming
      optimization, and reinforcement learning for graph coloring games.
    </p>
    <a class="home-more" href="{{ '/cv/#research' | relative_url }}">Research summaries <span aria-hidden="true">→</span></a>
  </section>

  <section class="home-section" aria-labelledby="home-blogs">
    <h2 id="home-blogs">Blogs</h2>
    <p>I write contest solutions, mathematical proofs, and paper reviews in three collections:</p>
    <ul class="home-blog-links" role="list">
      {% for blog in site.data.blogs %}
        <li><a href="{{ blog.redirect | escape }}">{{ blog.title | escape }}</a></li>
      {% endfor %}
    </ul>
  </section>
</div>
