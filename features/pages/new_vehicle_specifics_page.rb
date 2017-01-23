class NewVehicleSpecificsPage < SitePrism::Page
  sections :new_vehicle_trim_items, "*[class^='TrimListItem___'" do
  end

  def random_trim
    WaitUtil.wait_for_condition("vehicle trim to be visible") do
      new_vehicle_trim_items.sample.visible?
    end
    new_vehicle_trim_items.sample.root_element
  end

  def select_trim
    vehicle = random_trim
    @logger.info("Vehicle: " + vehicle.text)
    @selected_make = vehicle.text
    vehicle.click
  end

  def select_random_trim
    @logger = Logger.new(STDOUT)
    until page.has_no_content?("Select a") do
      select_vehicle
    end
    @selected_make
  end
end
