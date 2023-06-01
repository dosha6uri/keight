class PostsController < ApplicationController
  

  def create
    p = post_params
    user = User.find(p[:id])
    @post = Post.new(p)

    if @post .valid?
      puts "投稿完了"
    
    elsif user.posts.create(body: p[:body], submitter: current_user.id, comm_id: p[:comm_id], additional_content: p[:additional_content])
      flash[:notice] = 'Post was successfully created'
      
    else
      flash[:alert] = 'Something went wrong'
    #if current_page?("/users/user.id")
    #  redirect_to user_path(user.id)
    #elsif current_page?("/communities/#{p[:comm_id]}")
    #  redirect_to ("/communities/show/#{@p[:comm_id]}")
    end
    redirect_to(session[:return_to] )
    session.delete(:return_to)
    #end
  end

  def mini_create
    @user = current_user
    if Joining.where(user_id: current_user.id).empty? == false
      @joins = Joining.where(user_id: current_user.id)
      comm = []
      @joins.each {|join|
        @community = comm.push(Community.find(join[:comm_id]))
      }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.submitter)
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.submitter
      redirect_to("/communities/show/0")
    end
  end

  def update
    p = params
    @post = Post.find(p[:id])
    @post.body = p[:body]
    @post.additional_content = p[:additional_content]
    @post.save
    redirect_to "/communities/show/0"
  end

  def delete
    @post = Post.find(params[:id])
    submitter = @post[:submitter]
    @post.destroy
    redirect_back fallback_location: "/"
  end

  protected
  

  def post_params
    params.require(:post).permit(:body, :id, :comm_id, :additional_content)
  end
end
