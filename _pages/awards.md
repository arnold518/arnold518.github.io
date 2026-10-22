---
layout: page
title: Awards
permalink: /awards/
description: Competitive programming achievements and research & hackathon awards.
nav: true
nav_order: 2
---

## Competitive Programming

{% assign ps_awards = site.data.cv.cv.sections.Awards | where: 'category', 'competitive-programming' %}

| Year | Competition | Result |
| ---- | ----------- | ------ |
{% for award in ps_awards -%}
| {{ award.date }} | {{ award.title }} | {{ award.summary }} |
{% endfor %}

{% for entry in site.data.cv.cv.sections['Competitive Programming'] %}
**{{ entry.label }}:** {{ entry.details }}
{% endfor %}

## Research & Hackathon Awards

{% assign research_awards = site.data.cv.cv.sections.Awards | where: 'category', 'research-hackathon' %}

| Year | Award | Result |
| ---- | ----- | ------ |
{% for award in research_awards -%}
| {{ award.date }} | {{ award.title }} | {{ award.summary }} |
{% endfor %}
