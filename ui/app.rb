require_relative '../logic/Posts'
require 'sinatra'

postFinder = Posts.new

set :public_folder, File.dirname(__FILE__) + '/public'

get '/posts/:id' do |id|
    if id.nil?
        return halt 400, 'Su URL esta mal escrita, lo siento'
    end

    idToFind = id.to_i

    if idToFind == 0
        return 400, 'Su URL esta mal escrita, lo siento'

    end

    post = postFinder.findById idToFind

    if post.nil?
        return halt 404, 'Ups, Esta pagina no existe :('
    else
        return erb :post, :locals => {:post => post}
    end

end

get '/author/:name' do |name|
    if name.nil?
        return halt 400, 'Su URL esta mal escrita, lo siento'
    end

    posts = postFinder.findByAuthor name

    return erb :author, :locals => {:author => name, :posts => posts}

end

get '/tag/:tag' do |tag|
    if tag.nil?
        return halt 400, 'Su URL esta mal escrita, lo siento'
    end

    posts = postFinder.findByTag tag

    return erb :tag, :locals => {:tag => tag, :posts => posts}

end
