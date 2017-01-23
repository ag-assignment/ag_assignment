class VehicleSelectionModalPage < SitePrism::Page
  element :modal_header, "*[class^='newUsed']"

  sections :vehicle_list, "*[class^='listItem___']" do
  end

  def random_vehicle
    WaitUtil.wait_for_condition("vehicle list to be visible") do
      vehicle_list.sample.root_element.visible?
    end
    vehicle_list.sample.root_element
  end

  def select_vehicle
    vehicle = random_vehicle
    @logger.info("Vehicle: " + vehicle.text)
    @selected_make = vehicle.text
    vehicle.click
  end

  def select_random_vehicle(condition)
    @logger = Logger.new(STDOUT)
    if condition == "used"
      until page.has_no_content?("Shop Used") do
        select_vehicle
      end
    else
      select_vehicle
    end
    @selected_make
  end
end
