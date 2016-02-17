class PostsController < ApplicationController
    def index
       @posts = Post.all
    end
    
    def new
        @post=Post.new
        @category= Category.all
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path, :notice => "Your post was saved"
        else
            render "new"
        end
    end
    def post_params
        params.require(:post).permit(:title, :body, :category)
    end
   
    def edit
         @post =Post.find(params[:id])
        
    end
    def update
        @post =Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to post_path, :notice =>"your post hase been updated"
        else
            render "Edit"
        end
    end
    def show
        @post =Post.find(params[:id])
        
    end
    def destroy
        @post =Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, :notice => "post has been deleted"
    end
    
end
