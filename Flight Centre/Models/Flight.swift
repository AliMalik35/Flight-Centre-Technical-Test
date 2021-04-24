//
//  Flight.swift
//  Flight Centre
//
//  Created by Muhammad Ali Malik on 24/4/21.
//

import Foundation

/*
 A model to represent single flight data
 */

public class Flight: Hashable {
    /*
     Method to make Flight model/class equatable..
     */
    public static func == (lhs: Flight, rhs: Flight) -> Bool {
        return lhs.id == rhs.id  && lhs.airline_Code == rhs.airline_Code
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(airline_Code)
    }
    
    
    /*
     Variable Declaration
    
     */
    
    public var id:Int
    
    var departure_Date_Time:Array<Substring>
    
    var airline_Code:String
    
    var flight_Number:String
    
    var departure_City_Country:Array<Substring>
    
    var departure_Airport:String
    
    var arrival_City_Country:Array<Substring>
    
    var arrival_Airport:String
    
    var scheduled_Duration:String
    
    var arrival_Date_Time:Array<Substring>
    
    // Extra variables
    
    var departure_Date:String
    
    var departure_time:String
    
    var departure_City:String
    
    var departure_Country:String
    
    var arrival_Date:String
    
    var arrival_Time:String
    
    var arrival_City:String
    
    var arrival_Country:String
    
    /*
     var gate:String = ""
     
     var seat: String = ""
     
     var terminal:String = ""
     */
    
    /*
     Initializing Flight class using required parameters
     */
    
    init(ID: Int, DepartureDateTime: String,  AirlineCode: String, FlightNumber: String, DepartureCityCountry: String, DepartureAirport: String,
         
         ArrivalCityCountry: String, ArrivalAirport: String, ScheduledDuration: String, ArrivalDateTime: String) {
        
        
        self.id = ID
        
        self.departure_Date_Time = DepartureDateTime.split(separator: "T")
        
        self.airline_Code = AirlineCode
        
        self.flight_Number = FlightNumber
        
        self.departure_City_Country = DepartureCityCountry.split(separator: ",")
        
        self.departure_Airport = DepartureAirport
        
        self.arrival_City_Country = ArrivalCityCountry.split(separator: ",")
        
        self.arrival_Airport = ArrivalAirport
        
        self.scheduled_Duration = ScheduledDuration
        
        self.arrival_Date_Time = ArrivalDateTime.split(separator: "T")
        
        
        self.departure_Date = String(self.departure_Date_Time[0])
        
        self.departure_time = String(self.departure_Date_Time[1].prefix(5))
        
        self.departure_City = String(self.departure_City_Country[0])
        
        self.departure_Country = String(self.departure_City_Country[1])
        
        self.arrival_Date = String(self.arrival_Date_Time[0])
        
        self.arrival_Time = String(self.arrival_Date_Time[1].prefix(5))
        
        self.arrival_City = String(self.arrival_City_Country[0])
        
        self.arrival_Country = String(self.arrival_City_Country[1])
        
    }
    
    /*
     Method to get formatted date for detail view
     */
    
    func getFormattedDate(inputdate: String)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dateFormatterP = DateFormatter()
        dateFormatterP.dateFormat = "E, dd MMM"

        let date: NSDate? = dateFormatter.date(from: inputdate) as NSDate?
        return dateFormatterP.string(from: date! as Date)
    }
    
    func getFormattedDate2(inputdate: String)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dateFormatterP = DateFormatter()
        dateFormatterP.dateFormat = "E, dd MMMM"

        let date: NSDate? = dateFormatter.date(from: inputdate) as NSDate?
        return dateFormatterP.string(from: date! as Date)
    }
    
    /*
     Method to get formatted time for detail view
     */
    
    
    func getFormattedtime(inputTime: String)-> String {
        let TimeFormatter = DateFormatter()
        TimeFormatter.dateFormat = "HH:mm"

        let TimeFormatterP = DateFormatter()
        TimeFormatterP.dateFormat = "h:mm a"

        let date: NSDate? = TimeFormatter.date(from: inputTime) as NSDate?
        return TimeFormatterP.string(from: date! as Date)
    }
    
    /*
     Method to get formatted flight duration
     */
    
    
    func getFormattedDuration()-> String{
        var scheduled_Time:String = ""
        
        for char in scheduled_Duration {
            if char == "h" {
                scheduled_Time = scheduled_Time + " h"
            }
            else if char == "r"{
                scheduled_Time = scheduled_Time + "r "
            }
            else if char == "m"{
                scheduled_Time = scheduled_Time + " m"
            }
            else{
              scheduled_Time = scheduled_Time + String(char)
            }
        }
        
        return scheduled_Time
    }
    
    
    
}

