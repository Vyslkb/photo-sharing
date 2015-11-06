class PostsController < ApplicationController
    before_action :set_user


    def index
        @posts = Post.all
        @users = User.all
    end

    def show
        
        @posts = User.find(params[:id]).posts
    end

    def create
        caption = post_params[:caption]
        photo = post_params[:photo]   
        if photo.blank? != false
            flash[:error] = 'This is a photo sharing app. Come on'
            binding.pry 
            redirect_to new_post_path
        else
        @post = Post.create(:caption => caption, :photo => photo, :user_id => @user.id)
        redirect_to '/'
        end
    end


    def new
        @post = Post.new

        # binding.pry
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy 
        redirect_to posts_path 
    end


    private

    def set_user
        @user = User.find_by(id: current_user.id)
    end

    def post_params
        params.require(:post).permit(:caption, :photo)
    end

end