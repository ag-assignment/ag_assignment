class HomePage < SitePrism::Page
  set_url "/"

  element :shop_new_button, "button", text: "Shop New"
  element :shop_used_button, "button", text: "Shop Used"

  def select_condition(condition)
    case condition
    when "new"
      shop_new_button.click
    when "used"
      shop_used_button.click
    end
  end
end
