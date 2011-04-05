module ApplicationHelper

  def title
      base_title = "Strona o tytule"
      if @title.nil?
        base_title
      else
        @title   
      end
  end
  
  def logo
      image_tag("rails.png", :alt => "Header Logo", :class => "round")  
  end

end
