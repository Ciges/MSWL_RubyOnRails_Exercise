class PostsController < ApplicationController
    
    def index
        # @posts = Post.published.order('created_at desc')
        @posts = Post.includes("author").published.order('created_at desc')
    end

    def show
        # @post = Post.find(params[:id])
        @post = Post.includes("author").find(params[:id])
    end
    
    def new
        @post = Post.new
        @authors = Author.find(:all)
    end
    
    def create
        @post = Post.new(params[:post])
        @post.save
        if @post.save
            redirect_to @post, :notice => 'Post created'
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
        @authors = Author.find(:all)
    end

    def update
        @post = Post.find(params[:id])

        if @post.update_attributes(params[:post])
            redirect_to @post, :notice => 'Post updated'
        else
            render 'edit'
        end
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to posts_url, :notice => 'Post destroyed'
    end
    
    def drafts
        @posts = Post.includes("author").draft.order('created_at desc')
    end

end
