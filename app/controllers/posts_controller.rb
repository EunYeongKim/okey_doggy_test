class PostsController < ApplicationController
  before_action :authenticate_user!
  # 로그인한 회원만 할 수 있도록 함
  
  def index
    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.length
    # 사용자의 작성 글 갯수
  end
  
  def new
  end
  
  def create
    new_post = Post.new(user_id: current_user.id, title: params[:title], content: params[:content])
    if new_post.save
      redirect_to root_path
    else 
      redirect_to new_post_path
    end
  end
end
