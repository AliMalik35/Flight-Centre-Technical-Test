//
//  LoadFlightsViewModel.swift
//  Flight Centre
//
//  Created by Muhammad Ali Malik on 24/4/21.
//

import Foundation
import Alamofire
import SwiftyJSON


/*
 A viewModel to load flights detail and save them in a List of Flight Model
 */

class LoadflightsViewModel: ObservableObject {
    /*
     Variable Declartion
     */
    
    var FlightDataURL:String = "https://firebasestorage.googleapis.com/v0/b/flight-centre-brand.appspot.com/o/developer-test-flights-list.json?alt=media&token=81d93056-9c7f-451d-94b6-3e88eb6fa9ad"
    
    @Published var FlightsList = [Flight]()
    
    /*
     Initializing viewModel to load flight details
     */
    
    init() {
        LoadFlightData()
    }
    
    
    /*
     Method to load and parse flight data using API
     */
    
   
    func LoadFlightData() -> Void {
        
        AF.request(FlightDataURL, method: .get).responseJSON{
            respone in
            switch respone.result {
            case.success(let value):
                let flights_Data = JSON(value).arrayValue
              
                for Single_flight_Data in flights_Data {
                    if Single_flight_Data["id"].exists() {
                        let id = Single_flight_Data["id"].int ?? 0
                    
                        let departureDetail = Single_flight_Data["departure_date"].string ?? ""
                        
                        let arrivalDetail = Single_flight_Data["arrival_date"].string ?? ""
                     
                        let airlineCode = Single_flight_Data["airline_code"].string ?? ""
                        
                        let flightNumber = Single_flight_Data["flight_number"].string ?? ""
                        
                        let departureAreaDetail = Single_flight_Data["departure_city"].string ?? ""
                  
                        let arrivalAreaDetail = Single_flight_Data["arrival_city"].string ?? ""
                     
                        let departureAirport = Single_flight_Data["departure_airport"].string ?? ""
                        
                        let arrivalAirport = Single_flight_Data["arrival_airport"].string ?? ""
                      
                        let scheduledDuration = Single_flight_Data["scheduled_duration"].string ?? ""
                    
                        let FlightData = Flight(ID: id, DepartureDateTime: departureDetail, AirlineCode: airlineCode, FlightNumber: flightNumber, DepartureCityCountry: departureAreaDetail, DepartureAirport: departureAirport, ArrivalCityCountry: arrivalAreaDetail, ArrivalAirport: arrivalAirport, ScheduledDuration: scheduledDuration, ArrivalDateTime: arrivalDetail)
                    
                        self.FlightsList.append(FlightData)
 
                        
                    }
                   
                }
                
            case.failure(let error):
                print(error)
            }
        }
    }
    
  
}
