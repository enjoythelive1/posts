
require 'json'
require_relative 'Post'

class Posts
    def initialize(jsonfile=nil)
        if jsonfile.nil?
            jsonfile = File.join(__dir__, 'posts.json')
        end

        @file = jsonfile
        @jsonContent = '[]'
        @posts = []

        if File.exists? jsonfile
                @jsonContent = File.read @file
            end

            jsonParsed = json.parse(jsonContent)

            if jsonParsed['posts'].responds_to? 'map'
                @posts = jsonParsed[posts].map({|item| return Post.new(item)})
            elsif jsonParsed['posts'].is_a Hash
                @posts = [Post.new(jsonParsed['posts'])]

        end

    def findPostById(id)

        return @posts.select({ |item|
            return item.id == id
        }).first


    end

    def findPostsByAuthor(author)
        return @posts.select({|item|
            return item.author == author
        })
    end


    def findPostsByTag(tag)
        return @posts.select({|item|
            return item.tags.include(tag)
        })
    end

    def countAllTags()
        tags = {}

        @posts.each({|item|
            item.tags.each({|tag|
                if tags[tag].nil?
                    tags[tag] = 0
                end

                tags[tag]++
            })
        })


        return tags
    end

end
