class IssuesController < ApplicationController
  before_action :set_issue, :only => [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:c]
      @category = Category.find(params[:c])
      @issues = @category.issues
    else
      @issues = Issue.all
    end

    sort_by = if params[:order] == 'topic'
        'topic'
      elsif params[:order] == 'updated_at'
        'updated_at'
      elsif params[:order] == 'updated_at_desc'
        'updated_at DESC'
      end

    @issues = @issues.order(sort_by).page(params[:page]).per(5)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)

    @issue.user = current_user

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

  def search
    @issues = Issue.where( [ "topic like ?", "%#{params[:keyword]}%" ]).page(params[:page]).per(5)
    render :action => :index
  end

  private

  def issue_params
    params.require(:issue).permit(:topic, :content, :category_ids => [])
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
