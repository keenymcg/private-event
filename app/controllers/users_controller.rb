class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    ## Another TOP Student's code. Would mean adjusting the Users show page
    # def show  
    #     @my_events = Event.where(creator_id: current_user.id)
    # end
end
