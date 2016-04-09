# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://thetech.com"

SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/search'
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.namer = SitemapGenerator::SimpleNamer.new(:google_search_sitemap)


SitemapGenerator::Sitemap.create do
  add frontend_rss_feed_path, lastmod: Time.zone.now, changefreq: 'weekly', priority: 0.0

  add URI.unescape(frontend_static_page_path(name: "about/index")), lastmod: DateTime.local(2016-04-06), changefreq: 'monthly', priority: 0.8
  add URI.unescape(frontend_static_page_path("about/contact")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("about/opinion_policy")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.5
  add URI.unescape(frontend_static_page_path("about/comments")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.5
  add URI.unescape(frontend_static_page_path("about/unpublish")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.5
  add URI.unescape(frontend_static_page_path("about/copyright")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.5
  add URI.unescape(frontend_static_page_path("about/publication_schedule")), lastmod: DateTime.local(2016-04-06), changefreq: 'monthly', priority: 0.8
  add URI.unescape(frontend_static_page_path("about/subscribe")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("about/special_projects")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.0
  add URI.unescape(frontend_static_page_path("about/donate")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("about/join")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("about/staff")), lastmod: DateTime.local(2016-04-06), changefreq: 'weekly', priority: 0.8 


  add URI.unescape(frontend_static_page_path("ads/index")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("ads/schedule")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("ads/policies")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("ads/payment")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_static_page_path("ads/adscontact")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8

  add URI.unescape(frontend_adinfo_path("mit")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_adinfo_path("local")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_adinfo_path("national")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_adinfo_path("recruiter")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8
  add URI.unescape(frontend_adinfo_path("nonprofit")), lastmod: DateTime.local(2016-04-06), changefreq: 'never', priority: 0.8


  Piece.find_each do |piece|

  year = piece.publish_datetime.strftime('%Y')
  mo = piece.publish_datetime.strftime('%m')
  day = piece.publish_datetime.strftime('%d')

  tags_array = piece.tags

  tags_string = tags_array.join(", ")

  genre = ""
  case piece.section.slug
  when "opinion"
    genre = "OpEd, "
  when "arts"
    genre = "Opinion, "
  end

  genre << "UserGenerated"

  if !piece.article.nil? 
    add frontend_piece_path(year: year, month: mo, day: day, slug: piece.slug) , lastmod: piece.updated_at, priority: 1.0, changefreq: 'never'
  end

  if !piece.image.nil? 
    add frontend_piece_path(year: year, month: mo, day: day, slug: piece.slug) , lastmod: piece.updated_at, priority: 0.7, changefreq: 'never', images: [{
      loc: frontend_piece_path(year: year, month: mo, day: day, slug: piece.slug),
      caption: piece.image.caption.strip,
      title: "TODO",
      license: "http://creativecommons.org/licenses/by/3.0/deed.en_US"
       }]
  end
end  

  ActsAsTaggableOn::Tag.find_each do |tag| 
    add frontend_tag_path(tag.slug), lastmod: Time.zone.now, changefreq: 'weekly', priority: 0.1
  end

  Author.find_each do |author|
    add frontend_photographer_path(author.slug), lastmod: author.updated_at, changefreq: 'weekly', priority: 0.5

    add frontend_author_path(author.slug), lastmod: author.updated_at, changefreq: 'weekly', priority: 0.5
  end

  Section.find_each do |section|
    add frontend_section_path(section.slug), lastmod: section.updated_at, changefreq: 'always', priority: 1.0
  end

  Issue.find_each do |issue|
    add frontend_issue_path(volume: issue.volume.to_s, issue: issue.number.to_s), lastmod: issue.updated_at, changefreq: 'never', priority: 1.0
  end

end
