class NewCarsModelPage < SitePrism::Page
  sections :new_car_models, "*[class^='model___'" do
  end

  def random_vehicle
    WaitUtil.wait_for_condition("vehicle list to be visible") do
      new_car_models.sample.root_element.visible?
    end
    new_car_models.sample.root_element
  end

  def select_vehicle
    vehicle = random_vehicle
    @logger.info("Vehicle: " + vehicle.text)
    @selected_make = vehicle.text
    vehicle.click
  end

  def select_random_new_vehicle
    @logger = Logger.new(STDOUT)
    until page.has_no_content?("Find and Finance Your") do
      select_vehicle
    end
    @selected_make
  end
end
