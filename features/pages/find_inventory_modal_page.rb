class FindInventoryModalPage < SitePrism::Page
  element :location_input_field, 'input[placeholder="Enter City or Zip"]'
  element :find_button, "button", text: "FIND"
  element :use_my_location_button, "button", text: "USE MY LOCATION"

  def find_location(location)
    location_input_field.set(location)
    find_button.click
  end
end
