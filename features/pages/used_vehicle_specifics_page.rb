class UsedVehicleSpecificsPage < SitePrism::Page
  sections :used_vehicle_info_items, "*[class^='item___'" do
  end

  def random_vehicle
    WaitUtil.wait_for_condition("vehicle list to be visible") do
      used_vehicle_info_items.sample.root_element.visible?
    end
    used_vehicle_info_items.sample.root_element
  end

  def select_vehicle
    vehicle = random_vehicle
    @logger.info("Vehicle: " + vehicle.text)
    @selected_make = vehicle.text
    vehicle.click
  end

  def select_random_vehicle
    @logger = Logger.new(STDOUT)
    until page.has_no_content?("Select a") do
      select_vehicle
    end
    @selected_make
  end
end
