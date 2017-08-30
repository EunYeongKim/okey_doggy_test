class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership, only: [:edit, :update, :destroy]
  # 로그인한 회원만 할 수 있도록 함
  
  def index
    @posts = Post.all.order('created_at desc').paginate(page: params[:page], per_page: 10)
    @posts_count = current_user.posts.length
    # 사용자의 작성 글 갯수
  end
  
  def new
  end
  
  def create
    new_post = Post.new(user_id: current_user.id, title: params[:title], content: params[:content], image: params[:image])
    if new_post.save
      redirect_to posts_path
    else 
      redirect_to new_post_path
    end
  end
  
  
  def show
    @post = Post.find(params[:id])
  end
  
 
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.image = params[:image]
    
    if @post.save
      redirect_to root_path
    else
      render :edit
    end
  end
 
 def destroy
    @post.destroy
    redirect_to root_path
 end
 
 private
   def check_ownership
    @post = Post.find_by(id: params[:id])
    redirect_to root_path if @post.user_id != current_user.id
   end
 
end
