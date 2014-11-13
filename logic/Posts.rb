
require 'json'

class Posts
    def initialize(jsonfile=nil)
        if jsonfile.nil?
            jsonfile = File.join(__dir__, 'posts.json')
        end

        @file = jsonfile
        @jsonContent = '[]'

	if File.exists? jsonfile
            @jsonContent = File.read @file
        end

        @posts = json.parse(jsonContent)

    end

    def findPostById(id)
        if @posts.responds_to? 'select'

            return @posts.select({ |item|
                return item.id == id
            }).first

        end

        return nil

    end

    def findPostsByAuthor(author)
        if @posts.responds_to? 'select'

            return @posts.select({|item|
                return item.author == author
            })

        end
    end


    def findPostsByTag(tag)
        if @posts.responds_to? 'select'

            return @posts.select({|item|
                return item.tags.split(%r{,\s*}).include(tag)
            })

        end
    end

    #def findPostsByTag(tag)
    #    if @posts.responds_to? 'select'
#
    #        return @posts.select({|item|
    #            return item.tags.split(%r{,\s*}).include(tag)
    #        })
#
    #    end
    #end
end
