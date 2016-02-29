module ApplicationHelper
  def flash_messages_tags
    messages = ""
    flash.each do |type, mesg|
      type = "success" if type == "notice"
      type = "danger" if type == "error"

      messages += (content_tag(:div, class: "alert alert-#{type} alert-dismissible", role: "alert") do
        content_tag(:button, class: "close", data: {dismiss: "alert"}, "aria-label" => "Close") do
          content_tag(:span, raw("&times;"), "aria-hidden" => "true")
        end + mesg
      end)
    end

    return raw(messages)
  end
end
