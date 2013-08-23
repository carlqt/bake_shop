module PagesHelper
  def logo
    image_tag("logo.jpg", :alt => "bakeshop logo", :class => "round")
  end
end
