---
layout: page
title: Awards
permalink: /awards/
description: Competitive programming achievements and research awards.
nav: true
nav_order: 2
---

## Competitive programming

{% assign ps_awards = site.data.cv.cv.sections.Awards | where: 'category', 'competitive-programming' %}

| Year | Competition | Result |
| ---- | ----------- | ------ |
{% for award in ps_awards -%}
| {{ award.date }} | {{ award.title }} | {{ award.summary }} |
{% endfor %}

**Codeforces:** International Grandmaster.

## Research awards

{% assign research_awards = site.data.cv.cv.sections.Awards | where: 'category', 'research' %}

| Year | Award | Result |
| ---- | ----- | ------ |
{% for award in research_awards -%}
| {{ award.date }} | {{ award.title }} | {{ award.summary }} |
{% endfor %}
