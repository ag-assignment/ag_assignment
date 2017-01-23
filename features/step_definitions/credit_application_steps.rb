################ GIVEN ################

Given(/^I select a random vehicle condition$/) do
  @app.home_page.load
  @condition = ["new", "used"].sample
  @app.home_page.select_condition(@condition)
end

################ WHEN ################

When(/^I filter by location$/) do
  @location = "90210"
  @app.find_inventory_modal_page.find_location(@location)
end

When(/^I select a random vehicle$/) do
  WaitUtil.wait_for_condition("vehicle selection modal to be loaded") do
    @app.vehicle_selection_modal_page.all_there?
  end
  @vehicle_selected = @app.vehicle_selection_modal_page.select_random_vehicle(@condition)
  if @condition == "new"
    WaitUtil.wait_for_condition("new cars model page to be loaded") do
      @app.new_cars_model_page.all_there?
    end
    @app.new_cars_model_page.select_random_new_vehicle
  end
end

When(/^I go through vehicle selection flows$/) do
  if page.has_content?("Review Loan Details")
    @app.review_vehicle_page.used_vehicle_price_input.set("50000")
    @app.review_vehicle_page.odo_meter_reading_input.set("50000")
    expect(@app.review_vehicle_page).to have_content @vehicle_selected
    @app.review_vehicle_page.review_loan_next_button.click
    WaitUtil.wait_for_condition("select this dealer button to be visible") do
      @app.dealership_page.select_this_dealer_button.visible?
    end
    @app.dealership_page.select_this_dealer_button.click
  elsif page.has_content?("Filters")
    expect(@app.filtered_results_page).to have_content @vehicle_selected
    @app.filtered_results_page.select_filtered_vehicle
    expect(@app.review_vehicle_page).to have_content("Vehicle Overview")
    @app.review_vehicle_page.vehicle_overview_next_button.click
    expect(@app.review_vehicle_page).to have_content("Review")
    @app.review_vehicle_page.review_loan_next_button.click
  elsif page.has_content?("Vehicle Overview")
    expect(@app.review_vehicle_page).to have_content @vehicle_selected
    @app.review_vehicle_page.vehicle_overview_next_button.click
  elsif page.has_content?("Select a")
    WaitUtil.wait_for_condition("vehicle specifics page to be loaded") do
      @app.used_vehicle_specifics_page.all_there?
    end
    if page.has_content?("Trim")
      @vehicle_selected = @app.new_vehicle_specifics_page.select_random_trim
      expect(@app.review_vehicle_page).to have_content @vehicle_selected
      @app.review_vehicle_page.review_loan_next_button.click
      WaitUtil.wait_for_condition("select this dealer button to be visible") do
        @app.dealership_page.select_this_dealer_button.visible?
      end
      @app.dealership_page.select_this_dealer_button.click
    else
      @vehicle_selected = @app.used_vehicle_specifics_page.select_random_vehicle
    end
    expect(@app.review_vehicle_page).to have_content @vehicle_selected
    @app.review_vehicle_page.vehicle_overview_next_button.click
  end
end

################ THEN ################

Then(/^I am presented with personal information page$/) do
  expect(@app.credit_application_page).to have_content @vehicle_selected
  expect(@app.credit_application_page).to have_content("PERSONAL INFORMATION")
end
