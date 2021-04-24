//
//  LoadFlightsView.swift
//  Flight Centre
//
//  Created by Muhammad Ali Malik on 24/4/21.
//

import SwiftUI

/*
 A initial view which shows all flight detail using viewModel
 */

struct LoadFlightsView: View {
    
    /*
     Variables Declaration...
     */
    
    @ObservedObject private var viewModel: LoadflightsViewModel
   
    /*
     Initializing view with Load Flight view model
     */
    init(viewModel: LoadflightsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        
        
        NavigationView{
            
            ScrollView{
                
                VStack(alignment: .center){
                    ForEach(viewModel.FlightsList, id: \.self) { item in
                    NavigationLink(destination: FlightDetailView(flightinfo: item)) {
                        VStack(alignment: .leading){
                            
                            Text(item.getFormattedDate2(inputdate: item.departure_Date))
                                .foregroundColor(Color.LightGray4)
                                .padding(.top)
                                
                            Spacer()
                            VStack(alignment: .center){
                                FlightView(flightInfo: item)
                            }
                            .padding()
                            .background(Color.white)
                            .shadow(radius: 4)
                        }
                        
                        
                      
                        
                    }.navigationBarTitle("Trips")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            }
           
        }
       
    
    }
}

struct LoadFlightsView_Previews: PreviewProvider {
    static var previews: some View {
        LoadFlightsView(viewModel: LoadflightsViewModel())
    }
}
