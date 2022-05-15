class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @place = Place.find_by({ "id" => params["id"] })
        @posts = Post.where({ "place_id" => @place["id"] })
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new
        @post["title"] = params["post"]["title"]
        @post["posted_on"] = params["post"]["posted_on"]
        @post["image"] = params["post"]["image"]
        @post["description"] = params["post"]["description"]
        @post["place_id"] = params["post"]["place_id"]
        @post.save
        redirect_to "/places/#{params["post"]["place_id"]}"
    end
end
