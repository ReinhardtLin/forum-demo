module IssuesHelper

  def combine_issues_condition(original_params, default)
    original_params.slice(:order, :c).merge(default)
  end

end
