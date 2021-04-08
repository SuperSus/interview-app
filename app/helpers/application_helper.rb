module ApplicationHelper
    def logged_helper (css_class = "")
      if current_user.is_a?(GuestUser)
        return_if_not_logged_in css_class
      else
        return_if_logged_in css_class
       end
    end

     def copyright_generator
        raw "Dmitry Shveikus | All rights reserved"
     end

     def links_helper (css_class = "", tag = :li)
        html_string = nav_links.each_with_object("") do |i, str|
          str << (content_tag tag, (link_to i[:name],
            i[:url],
            class: css_class))
        end
        raw html_string
     end

     def form_movie_button_text
        if current_page? new_movie_path
          'Add movie'
        else
          'Update movie'
        end
     end

     def flash_message
         return content_tag :span, notice, class: "flash error"  if notice
         return content_tag :span, alert, class: "flash error" if alert
     end

    private

      def return_if_logged_in css_class
        (content_tag :div, link_to("You are #{current_user.first_name}", edit_user_registration_path, class: css_class), class: 'p-2 mr-2') +
        (content_tag :div, link_to("Log out", destroy_user_session_path, method: :delete, class: css_class), class: 'p-2 mr-2')
      end

      def return_if_not_logged_in css_class
        (content_tag :div, (link_to "Log in", new_user_session_path, class: css_class), class: 'p-2 mr-2') +
        (content_tag :div, (link_to "Register", new_user_registration_path, class: css_class), class: 'p-2 mr-2')
      end
end
