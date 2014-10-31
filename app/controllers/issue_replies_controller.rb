class IssueRepliesController < ApplicationController

  before_action :find_issue
  before_action :authenticate_user!

  def index
    @replies = @issue.replies
  end

  def show
    @reply = @issue.replies.find( params[:id] )
  end

  def new
    @reply = @issue.replies.build
  end

  def create
    @reply = @issue.replies.build( reply_params )
    @issue.replies_count +=1

    if @reply.save
      @issue.save
      redirect_to issue_replies_url( @issue )
    else
      render :action => :new
    end
  end

  def edit
    @reply = @issue.replies.find( params[:id] )
  end

  def update
    @reply = @issue.replies.find( params[:id] )

    if @reply.update( reply_params )
      redirect_to issue_replies_url( @issue )
    else
      render :action => :new
    end

  end

  def destroy
    @reply = @issue.replies.find( params[:id] )
    @reply.destroy

    redirect_to issue_replies_url( @issue )
  end

  protected

  def find_issue
    @issue = Issue.find( params[:issue_id] )
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
