class Post
    attr_accessor: id, title, tags, description, author

    def initialize(hash)
        if !hash.nil?
            @id = hash['id']
            @title = hash['title']
            @tags = hash['tags'].split(%r{,\s*})
            @description = hash['description']
            @author = hash['author']
        end
    end

    def descriptionResume()
        return @description[0 ... 10] <<< " ..."
    end
end
