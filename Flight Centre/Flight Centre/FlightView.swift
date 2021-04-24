//
//  FlightView.swift
//  Flight Centre
//
//  Created by USM Admin on 24/4/21.
//

import SwiftUI
/*
 A view to show single flight information using flightinfo as input on main screen
 */

struct FlightView: View {
   
    /*
     Variables Declaration...
     */
    
    var flightInfo:Flight
    
    var body: some View {
        VStack{
            Text("Flight to \(flightInfo.arrival_City)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.trailing, 180)
            Divider()
                .padding(.bottom)
            
            HStack{
                VStack{
                    Text(flightInfo.departure_Airport)
                        .foregroundColor(.gray)
                    Text(flightInfo.departure_time)
                        .foregroundColor(.blue)
                        .font(.title)
                    Text(flightInfo.departure_City)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding()
                
                VStack{
                    HStack{
                        Text(flightInfo.getFormattedDuration())
                            .font(.subheadline)
                      
                    }.padding(.top)
                    .foregroundColor(Color.LightGray4)
                    
                    HStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                            .frame(height: 1)
                            .foregroundColor(.blue)
                        Image(systemName: "airplane")
                            .foregroundColor(.blue)
                        Line()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                            .frame(height: 1)
                            .foregroundColor(.blue)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                        
                    }
                   
                    Text("Non-Stop")
                        
                        .foregroundColor(Color.LightGray4)
                        .font(.subheadline)
                    
                    
                }
                .padding(.bottom,50)
                
                VStack{
                    Text(flightInfo.arrival_Airport)
                        .foregroundColor(.gray)
                    Text(flightInfo.arrival_Time)
                        .foregroundColor(.blue)
                        .font(.title)
                    Text(flightInfo.arrival_City)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }.padding()

            }
            
        }
        
    }
}


/*
 A struct to draw dotted lines
 */

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

/*
  color extension
 */

extension Color {
     static let LightGray4 = Color("LightGray")
    static let DarkBlue = Color("DarkBlue")
     
}

