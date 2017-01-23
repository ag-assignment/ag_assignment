module Pages
  class App
    def home_page
      HomePage.new
    end

    def find_inventory_modal_page
      FindInventoryModalPage.new
    end

    def vehicle_selection_modal_page
      VehicleSelectionModalPage.new
    end

    def new_cars_model_page
      NewCarsModelPage.new
    end

    def review_vehicle_page
      ReviewVehiclePage.new
    end

    def credit_application_page
      CreditApplicationPage.new
    end

    def dealership_page
      DealershipPage.new
    end

    def filtered_results_page
      FilteredResultsPage.new
    end

    def used_vehicle_specifics_page
      UsedVehicleSpecificsPage.new
    end

    def new_vehicle_specifics_page
      NewVehicleSpecificsPage.new
    end
  end
end
