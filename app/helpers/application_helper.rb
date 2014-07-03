module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def fix_date(str)
    str.strftime("%c %Z")
    #if logged_in? && !current_user.time_zone.blank?
    # str = str.in_time_zone(current_user.time_zone)
    #end
  end
end
