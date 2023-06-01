class JoiningsController < ApplicationController

    def create
        
        Joining.create(join_params)
        redirect_to("/communities/show/#{join_params[:comm_id]}")
    end

    protected

    def join_params
        params.require(:joining).permit(:user_id, :comm_id)
    end
end
