class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(params[:post])

    if @post_form.valid?
      Post.create(@post_form.attributes)
      flash[:notice] = "Successfully created"
      redirect_to :posts
    else
      flash[:alert] = "Validation errors"
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post_form = PostForm.new(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post_form = PostForm.new(params[:post])

    if @post_form.valid?
      @post.update_attributes(@post_form.attributes)
      flash[:notice] = "Successfully updated"
      redirect_to :posts
    else
      flash[:alert] = "Validation errors"
      render "edit"
    end
  end
end
