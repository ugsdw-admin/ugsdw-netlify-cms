---
title: News
permalink: /news
css: news-wrapper
---
# Latest News

{% assign current_date = now | date: 'yyyyMMdd' | integer %}
{% assign date_to_check = post.archive-date | date: 'yyyyMMdd' | integer %}

<div class="post-container">
        {% for post in site.posts limit: site.data.home.news.max-articles %}
            {% if date_to_check <= current_date %}
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