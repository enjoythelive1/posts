require_relative '../logic/Posts'
require 'test/unit'

postsfile = File.join(__dir__, "post.json")

class testPosts < Test::Unit::TestCase
    def correctInitialization
        @postsAccess = Posts.new(postfile)
        assert_not_nil(@postsAccess, "Instancia creada correctamente")
    end

    def findByIDTest
        post1 = @postsaAccess.findById(1)
        assert_not_nil(post1, "Se encontro el elemento")
        assert_instance_of(Post, post1, "Es un post")
        assert_equal(1, post1.id, "El id del item encontrado debe de ser 1")
    end

    def findByAuthorTest
        posts = @postsaAccess.findByAuthor("Pixelated")
        assert_not_nil(posts, "Se encontro los elementos")
        assert_instance_of(Array, posts, "Es un array")
        assert(!posts.empty?, "No debe de estar vacio")
        assert_equal(1, posts.count, "Deben de haber 1 posts")
        posts.each do |post|
            assert_equal("Pixelated", post.author, "Debe de tener como autor a \"Pixelated\"")
        end
    end

    def findByTagTest
        posts = @postsaAccess.findPostsByTag("fitness")
        assert_not_nil(posts, "Se encontro los elementos")
        assert_instance_of(Array, posts, "Es un array")
        assert(posts.empty?, "Debe de estar vacio")
    end

    def countAllTagsTest
        tags = @postsaAccess.countAllTags
        assert_not_nil(tags, "Devolvio un elemento")
        assert_instance_of(Hash, tags, "Devolvio un hash")
        assert(!tags.empty?, "No debe de estar vacio")

        assert_equal(1, tags["cooking"], "La cantidad de post con el tag \"cooking\" debe de ser 1")
        assert_equal(1, tags["sports"], "La cantidad de post con el tag \"sports\" debe de ser 1")
    end

end
