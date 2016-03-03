module ApplicationHelper

  # Bootstrap style alerts
  def alert(alert_level)
    content_tag :div, class: ['alert', "alert-#{alert_level}", 'alert-dismissible'], role: 'alert' do
      button = content_tag :button, type: 'button', class: 'close', 'data-dismiss': 'alert', 'aria-label': 'Close' do
        content_tag :span, sanitize('&times;'), 'aria-hidden': 'true'
      end
      concat button
      yield
    end
  end

  # Bootstrap navbar
  def nav_bar
    content_tag :nav, class: "nav navbar-nav" do
      yield
    end
  end

  # Extension of 'link_to' for bootstrap
  # Sets "class='active'" in the <li> tag"
  def nav_link(text, path)
    if current_page? path
      content_tag :li, class: 'active'  do

        # <span class="sr-only">(current)</span> required for Screen Readers
        link_to path do
          sanitize text + content_tag(:span, '(current)', class: 'sr-only')
        end
      end
    else
      content_tag :li do
        link_to(text, path)
      end
    end
  end
end
