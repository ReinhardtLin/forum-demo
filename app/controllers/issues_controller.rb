class IssuesController < ApplicationController
  before_action :set_issue, :only => [ :show, :edit, :update, :destroy]

  def index
    @issues = Issue.page(params[:page]).per(5)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to issues_url
      flash[:notice] = "issue was successfully created"
    else
      render :action => :new
    end
  end

  def show
    @page_title = @issue.topic
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      redirect_to issue_url(@issue)
      flash[:notice] = "issue was successfully updated"
    else
      render :action => :edit
    end
  end

  def destroy
    @issue.destroy
    redirect_to issues_url
    flash[:alert] = "issue was successfully deleted"
  end

  private

  def issue_params
    params.require(:issue).permit(:topic, :content)
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end
end