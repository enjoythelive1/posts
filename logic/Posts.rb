
require 'json'
require_relative 'Post'

class Posts
    def initialize(jsonfile=nil)

        if jsonfile.nil?
            jsonfile = './posts.json'
        end

        @file = jsonfile
        @jsonContent = '[]'
        @posts = []

        if File.exists? @file
            @jsonContent = File.read @file
        end

        jsonParsed = JSON.parse(@jsonContent)

        listOfPost = Array.try_convert(jsonParsed['posts'])

        if listOfPost
            @posts = listOfPost.map { |item| Post.new(item) }
        elsif jsonParsed['posts'].is_a? Hash
            @posts = [Post.new(jsonParsed['posts'])]
        end

    end

    def findById(id)

        return (@posts.select { |item| item.id == id }).first

    end

    def findByAuthor(author)
        return @posts.select{|item| item.author == author }
    end


    def findByTag(tagToFind)
        return @posts.select{|item| item.tags.include?(tagToFind)}
    end

    def countAllTags()
        tags = {}

        @posts.each {|item|
            item.tags.each { |tag|
                if tags[tag].nil?
                    tags[tag] = 0
                end

                tags[tag]+= 1
            }
        }


        return tags
    end

end
