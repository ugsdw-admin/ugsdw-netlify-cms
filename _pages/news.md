---
title: News
permalink: /news
css: news-wrapper
---
# Latest News

{% assign current_date = 'now' | date: "%Y%m%d" | to_integer %}
{{ current_date }}

<div class="post-container">
        {% for post in site.posts limit: site.data.home.news.max-articles %}
            {% if current-date <= post.archive-date %}
                <a href="{{ post.url }}">
                    <article>
                        <div class="img-wrapper">
                            {% assign images = post.content | split:'img ' %} 
                            {% for image in images %}
                                {% if image contains 'src' %}
                                    {% assign html = image | split:"/>" | first %}
                                    <img loading="lazy" {{ html }} />
                                    {% break %}
                                {% endif %}
                            {% endfor %}
                        </div>
                        <div class="content-wrapper">
                            <h2>
                                {{ post.title | smartify }}
                            </h2>
                            <h3>
                                {{ post.subtitle | smartify }}
                            </h3>
                        </div>
                    </article>
                </a>
            {% endif %}
        {% endfor %}
    </div>