module ApplicationHelper
  include SessionsHelper
  def full_title(page_title)
    base_title = ""
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
  

  def remove_link(request)
    link_to image_tag("http://png-2.findicons.com/files//icons/2015/24x24_free_application/24/erase.png"), 
    request, confirm: "Are you sure?", method: :delete, remote: true
  end  
end
