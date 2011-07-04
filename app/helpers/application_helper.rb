module ApplicationHelper

  # Use within views to set the page's HTML title
  def title(text)
    content_for(:title) { text }
  end

  # Use within views to set the page's HTML meta description
  def description(text)
    content_for(:description) { text }
  end

  # Use within views to set the page's H1 header
  def h1(text)
    content_for(:h1) { text }
  end

  # Displays all flash messages in appropriately named divs for easy styling
  def flash_messages
    f_names = [:notice, :alert, :message]
    fl = ''

    for name in f_names
      if flash[name]
        fl = fl + "<div class=\"notice\">#{flash[name]}</div>"
      end
      flash[name] = nil;
    end

    fl.html_safe
  end

end
