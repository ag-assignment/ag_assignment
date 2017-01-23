class ReviewVehiclePage < SitePrism::Page
  element :vehicle_overview_next_button, "button", text: "Next"
  element :review_loan_next_button, "button", text: "NEXT"
  element :content_title, "*[class^='contentTitle___']"
  element :used_vehicle_price_input, "#usedVehiclePriceinput"
  element :odo_meter_reading_input, "#odometerReadinginput"

  def content_title
    content_title.text
  end
end
