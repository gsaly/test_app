module ApplicationHelper

  #Return default full title when missing
  def full_title(page_title)
    base_title = "Ruby on Rails Test App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
