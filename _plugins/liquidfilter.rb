# For using liquid in Jekyll frontmatter. Source: https://github.com/gemfarmer/jekyll-liquify

module LiquidFilter
  def liquify(input)
    Liquid::Template.parse(input).render(@context)
module Jekyll
  module LiquifyFilter
    def liquify(input)
      if input.is_a? String
        Liquid::Template.parse(input).render(@context)
      else
        input
      end
    end
  end
end