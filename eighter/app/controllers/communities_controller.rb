class CommunitiesController < ApplicationController
    before_action :authenticate_user!

    def new
        @community = Community.new
    end

    def create_community
        @community = Community.new(comm_name: params[:comm_name], opened: params[:opened], create_user_id: current_user.id)
        if @community.valid?
            @community.save
            @joins = Joining.new( user_id: current_user.id, comm_id: @community.id)
            @joins.save
            redirect_to("/communities/show/#{@community.id}")
        else
            render("/communities/new")
        end
    end


    def show
        c = params[:comm_id]
        @user = current_user
        @community = Community.find(c)
        if c == 0
            @posts = Post.all.order('created_at desc')
            @posts.delete_if {|post|
                user_joins(current_user.id, post.comm_id)
            }
        else
            @posts = Post.where(comm_id: c).order('created_at desc')
        end
        @u = user_joins(current_user.id, c)
    end

    def edit
        @community = Community.find(params[:id])
        if current_user.id != @community.create_user_id
            redirect_to("/communities/show/#{params[:id]}")
        end

        if @community.intro == nil
            @i = nil
        else
            @i = @community.intro
        end
    end

    def update
        p = params
        @community = Community.find(p[:id])
        @community.comm_name = p[:comm_name]
        @community.opened = p[:opened]
        @community.intro = p[:intro]
        if @community.valid?
            @community.save
            redirect_to "/communities/show/#{@community.id}"
        else
            render :new
        end
      end

    def delete

        @community = Community.find(params[:id])
        if current_user.id != @community.create_user_id
            redirect_to("/communities/show/#{params[:id]}")
        end
        @posts = Post.where(comm_id: params[:id])
        @joins = Joining.where(comm_id: params[:id])
        if @posts.empty? == false
          @posts.destroy
        end
        @joins.each {|join|
            join.destroy
        }
        @community.destroy
        redirect_to "/users/#{current_user.id}"
    end

    private
    #def create_params
    #    params.require(:community).permit(:comm_name)
    #end

    def user_joins(user_id, comm_id)
        if Joining.where(comm_id: comm_id).where(user_id: user_id).empty?
            false
        else
            true
        end
    end

    protected

    #def post_params
    #    params.require(:post).permit(:body, :id, :comm_id)
    #end

    #def join_params
    #    params.require(:joining).permit(:user_id, :comm_id)
    #end

end
