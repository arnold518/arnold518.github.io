---
layout: page
title: Notes
permalink: /notes/
description: Study notes, problem solutions, and paper reviews.
nav: true
nav_order: 4
---

These collections bring together my solutions, explanations, and study notes.

{% for note in site.data.notes %}
## [{{ note.title }}]({{ note.url }})

{{ note.description }}

{{ note.details }}

[Read notes →]({{ note.url }}) · [Source on GitHub]({{ note.source }})

{% endfor %}
