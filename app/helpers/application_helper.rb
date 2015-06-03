module ApplicationHelper

  def textile content
    raw content.gsub(/[\r\n]+/, "<br>") if content
  end
end
