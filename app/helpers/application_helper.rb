module ApplicationHelper

  # Bootstrap navbar
  def nav_bar
    content_tag(:nav, class: "nav navbar-nav") do
      yield
    end
  end

  # Extension of 'link_to' for bootstrap
  # Sets "class='active'" in the <li> tag"
  def nav_link(text, path)
    if current_page?(path)
      options = { class: 'active' }
    else
      options = {}
    end

    content_tag(:li, options) do
      link_to text, path
    end
  end
end
