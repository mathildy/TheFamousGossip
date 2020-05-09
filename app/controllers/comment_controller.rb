class CommentController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment =  Comment.new(content: params[:content], user_id: current_user.id, gossip_id: params[:id])
    if @comment.save 
      puts "Success"
      redirect_to gossip_path(params[:id])
    else
      puts "Fail"
      render "/"
    end
  end 
  
  
  def edit
    @comment = Comment.find(params[:id])

  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
        redirect_to "/"
    else
        render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/"
  end
  
end
