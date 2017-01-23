class FilteredResultsPage < SitePrism::Page
  sections :filtered_vehicle_list, "*[class^='inventoryListCard___'" do
  end

  def random_vehicle
    filtered_vehicle_list.sample.root_element
  end

  def select_filtered_vehicle
    random_vehicle.click
  end
end
