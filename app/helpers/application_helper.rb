# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title(str, container = nil)
    @page_title = h(strip_tags(str))
    content_tag(container, str) if container
  end
  
end
