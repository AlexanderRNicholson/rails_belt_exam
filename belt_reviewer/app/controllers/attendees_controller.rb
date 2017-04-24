class AttendeesController < ApplicationController

def new
end

def create
    @user = current_user
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
        redirect_to "/events"
    else
        flash[:errors] = @attendee.errors.full_messages
        redirect_to "/events"
    end
end

def destroy
    @attendee = Attendee.where(event_id:params[:id], user_id:current_user).first
    @attendee.destroy
    redirect_to "/events"
end

private
def attendee_params
    params.require(:attendee).permit(:event_id).merge(user: current_user)
end

end
