module ApplicationHelper
  def breadcrumbs(*crumbs)
    content_for(:breadcrumb) do
      render 'shared/breadcrumbs', crumbs: crumbs
    end
  end
end
