<!DOCTYPE html>
<html>
    {% include head.html %}
    <body>
        {% include header.html %}

        <main>
            <section class="main-content">
                {% if page.contents %}
                    {% for item in page.contents %}
                        {% if item.type == "text" %}
                            {{ item.text }}
                        {% elsif item.type == "button" %}
                            <a href="{{ item.link }}" class="
                                                            {% if item.gold == true %}
                                                                gold button
                                                            {% else %}
                                                                button
                                                            {% endif %}"
                                                            >{{ item.text }}</a>
                        {% elsif item.type == "break" %}
                            <br>
                        {% elsif item.type == "pdf" %}
                            <iframe height="{{ item.size }}" src="{{ item.link }}"></iframe>
                        {% elsif item.type == "press-release" %}
                            {{ site.data.global.press-release-tag }}
                        {% elsif item.type == "news" %}
                            <div class="post-container">
                                {% case item.archive-filter %}
                                    {% when "all" %}
                                        {% for post in site.posts limit: item.limit %}
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
                                        {% endfor %}
                                    {% when "archive-only" %}
                                        {% for post in site.posts limit: item.limit %}
                                            {% assign post-date = post.date | date: "%Y%m%d" | to_integer %}
                                            {% if post-date < site.data.global.archive-date %}
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
                                    {% when "recent-only" %}
                                        {% for post in site.posts limit: item.limit %}
                                            {% assign post-date = post.date | date: "%Y%m%d" | to_integer %}
                                            {% if post-date > site.data.global.archive-date %}
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
                                {% endcase %}
                            </div>
                        {% endif %}
                    {% endfor %}
                {% else %}
                    {{ content }}
                {% endif %}
            </section>

            {% unless page.nosidebar %}
                <aside>
                    {% include sidebar.html %}
                </aside>
            {% endunless %}
        </main>

        {% include footer.html %}
    </body>
</html>
