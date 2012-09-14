# copied from: http://mikeferrier.com/2011/04/29/blogging-with-jekyll-haml-sass-and-jammit/
#
# There had been a SASS converter from mikeferrier.com (and a better one at https://gist.github.com/960150)
# but I ended up putting SASS into the Rakefile because the automatic running of SASS wasn't working for me.
module Jekyll
  require 'haml'
  class HamlConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /haml/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      begin
        engine = Haml::Engine.new(content)
        engine.render
      rescue StandardError => e
        puts "!!! HAML Error: " + e.message
        puts "Line: #{e.line} (not counting YAML front matter)"
      end
    end
  end
end
