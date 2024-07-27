---
title: News
permalink: /news
---
`<div class="post-container">`

`{% for post in site.posts %}`

`<a href="{{ post.url }}">`

`<article>`

`<div class="img-wrapper">`

`{% assign images = post.content | split:'img ' %}`

`{% for image in images %}`

`{% if image contains 'src' %}`

`{% assign html = image | split:"/>" | first %}`

`<img loading="lazy" {{ html }} />`

`{% break %}`

`{% endif %}`

`{% endfor %}`

`</div>`

`<div class="content-wrapper">`

`<h2>`

`{{ post.title | smartify }}`

`</h2>`

`<h3>`

`{{ post.subtitle | smartify }}`

`</h3>`

`</div>`

`</article>`

`</a>`

`{% endfor %}`

````

`</div>`