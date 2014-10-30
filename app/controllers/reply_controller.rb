class ReplyController < ApplicationController
  def create
    @reply = @issue.attendees.build(reply_params)
    if @reply.save
      redirect_to replies_url
      flash[:notice] = "issue was successfully replied"
    else
      render :template => "topics/show"
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
