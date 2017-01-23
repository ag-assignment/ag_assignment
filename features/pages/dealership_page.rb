class DealershipPage < SitePrism::Page
  element :location_input_field, "*[class^='placeholder___']"
  element :magnify_glass_button, "*[class^='inputFieldLeftIcon___']"
  element :select_this_dealer_button, "button", text: "Select this Dealer"

  def find_dealer(location)
    location_input_field.set(location)
    magnify_glass_button.click
    select_this_dealer_button.click
  end
end
