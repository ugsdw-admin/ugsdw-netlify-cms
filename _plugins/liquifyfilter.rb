# For using liquid in Jekyll frontmatter. Source: https://github.com/gemfarmer/jekyll-liquify

module LiquifyFilter
  def liquify(input)
    if input.is_a? String
      Liquid::Template.parse(input).render(@context)
    else
      input
    end
  end
end

Liquid::Template.register_filter(LiquifyFilter)