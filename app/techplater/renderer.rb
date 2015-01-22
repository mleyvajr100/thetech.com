module Techplater
  class Renderer
    def initialize(template, chunks)
      @template = template
      @chunks = chunks
    end

    def render
      require 'handlebars'

      handlebars = Handlebars::Context.new
      handlebars.register_helper(:imageTag, &method(:image_tag_helper))
      handlebars.register_helper(:articleListTag, &method(:article_list_tag_helper))

      template = handlebars.compile(@template)

      template.call(chunks: @chunks)
    end

    private
      def image_tag_helper(context, image, style)
        begin
          [
            "<div class='img #{style}'>",
            "  <img src='#{Picture.find(image).content.url}'>",
            "  <p class='caption'>#{Picture.find(image).image.caption}</p>",
            "  <p class='attribution'>#{Picture.find(image).image.attribution}</p>",
            "</div>"
          ].join("\n")
        rescue ActiveRecord::RecordNotFound
          ''
        end
      end

      def article_list_tag_helper(context, article_list)
        begin
          [
            "<ol class='article_list'>",
            ArticleList.find(article_list).article_list_items.map do |i|
              "<li>" + "<a href='#{i.piece.frontend_display_path}'>#{i.piece.title}</a>" + "</li>"
            end,
            "</ol>"
          ].join("\n")
        rescue ActiveRecord::RecordNotFound
          ''
        end
      end
  end
end