module ApplicationHelper

  # Bootstrap style alerts - http://getbootstrap.com/components/#alerts
  def bootstrap_alert(alert_level)
    content_tag :div, class: ['alert', "alert-#{alert_level}", 'alert-dismissible'], role: 'alert' do
      button = content_tag :button, type: 'button', class: 'close', 'data-dismiss': 'alert', 'aria-label': 'Close' do
        content_tag :span, sanitize('&times;'), 'aria-hidden': 'true'
      end

      concat content_tag :span, '', class: 'glyphicon glyphicon-exclamation-sign', 'aria-hidden': true
      concat button
      yield
    end
  end

  # Bootstrap navbar
  def nav_bar(options = {})
    options[:class] = "nav navbar-nav" + options[:class].to_s
    content_tag :nav, options do
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
          concat text
          concat content_tag :span, '(current)', class: 'sr-only'
        end
      end
    else
      content_tag :li do
        link_to text, path
      end
    end
  end
end
