class MypageController < ApplicationController
    def index   
    end
    
    def edit
        @post = Post.find_by(id: params[:id])
      end
  
  def new
  end
    
   
end
