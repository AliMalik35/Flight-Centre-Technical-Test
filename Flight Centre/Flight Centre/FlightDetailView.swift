//
//  FlightDetailView.swift
//  Flight Centre
//
//  Created by Muhammad Ali Malik on 24/4/21.
//

import SwiftUI

/*
 A view to show detail about flight information using flightinfo as input
 */

struct FlightDetailView: View {
    
    /*
     Variables Declaration...
     */
    
    var flightinfo: Flight
    
    /*
    There is no information about these three variable in loaded data from api, so I am using fixed variables
     */
    
    var terminal: String = "D"
    var gate:String = "--"
    var seat:String = "--"
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    VStack{
                        Text(flightinfo.departure_Airport)
                            .font(.largeTitle)
                            .bold()
                        Text(flightinfo.departure_City)
                            .foregroundColor(Color.LightGray4)
                    }.padding()
                    Spacer()
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                      Spacer()
                    VStack{
                        Text(flightinfo.arrival_Airport)
                            .font(.largeTitle)
                            .bold()
                        Text(flightinfo.arrival_City)
                            .foregroundColor(Color.LightGray4)
                    }.padding()
                }.foregroundColor(.white)
              
                .padding()
            
                HStack{
                    VStack{
                        Text(flightinfo.getFormattedDate(inputdate: flightinfo.departure_Date))
                        Text(flightinfo.getFormattedtime(inputTime: flightinfo.departure_time))
                    }
                    .padding()
                   Spacer()
                    VStack{
                        Text(flightinfo.getFormattedDate(inputdate: flightinfo.arrival_Date))
                        Text(flightinfo.getFormattedtime(inputTime: flightinfo.arrival_Time))
                    }
                    .padding()
                }.foregroundColor(.white)
                .padding()
            }  .background(Color.DarkBlue)
            
            HStack{
                Text("Flight:")
                    .padding(.leading)
                Text("\(flightinfo.airline_Code)\(flightinfo.flight_Number)")
                    .foregroundColor(Color.DarkBlue)
                Spacer()
                Text("Gate:")
                    .padding(.trailing)
                Text(gate)
                    .foregroundColor(Color.DarkBlue)
                    .padding(.trailing)
                
            }
            .padding()
           
            HStack{
               
                Text("Terminal:")
                    .padding(.leading)
                Text(terminal)
                    .foregroundColor(Color.DarkBlue)
                Spacer()
                Text("Seat:")
                    .padding(.trailing)
                Text(seat)
                    .foregroundColor(Color.DarkBlue)
                    .padding(.trailing)
                
            }
            .padding()
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                .frame(height: 1)
                .foregroundColor(Color.LightGray4)
                .padding()
            Image(systemName: "qrcode")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background(Color.LightGray4)
                .padding()
        }
        
        
   
       
        
        
       
    }
}


