class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
        @range = params[:range]
        @type = params[:search_type]
        @id = params[:comm_id]
        @ans = []

        if @type == 'perfect'
            if @range == 'User'
                @ans = User.where('username LIKE ?', "#{params[:keyword]}")
            elsif @renge == 'Comm'
                @ans = Community.where('comm_name LIKE ?', "#{params[:keyword]}").or(Community.where('intro LIKE ?', "#{params[:keyword]}"))
            elsif @range == 'Post'
                if @id != nil
                    @ans = Post.where(comm_id: @id).where('body LIKE ?', "#{params[:keyword]}")
                else
                    @ans = Post.where('body LIKE ?', "#{params[:keyword]}")
                end
            end
        elsif @type == 'part'
            if @range == 'User'
                @ans = User.where('username LIKE ?', "%#{params[:keyword]}%")
            elsif @renge == 'Comm'
                @ans = Community.where('comm_name LIKE ?', "%#{params[:keyword]}%").or(Community.where('intro LIKE ?', "%#{params[:keyword]}%"))
            elsif @range == 'Post'
                if @id != nil
                    @ans = Post.where(comm_id: @id).where('body LIKE ?', "%#{params[:keyword]}%")
                else
                    @ans = Post.where('body LIKE ?', "%#{params[:keyword]}%")
                end
            
            end
        end
    end
end
