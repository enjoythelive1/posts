class Post
    attr_accessor :id, :title, :tags, :description, :author

    def initialize(hash)
        if !hash.nil?
            @id = hash['id'].to_i
            @title = hash['title']
            @tags = hash['tags'].split(%r{,\s*})
            @description = hash['description']
            @author = hash['author']
        end
    end

    def description_summary()
        index = 0
        maxindex = @description.length - 1
        for i in 0..9
            index = @description.index(/\s/, index)

            if index.nil?
                return @description << '...'
            end

            index += 1

            if index > maxindex
                break;
            end

        end

        return @description[0 .. index - 1] << '...'
    end
end
