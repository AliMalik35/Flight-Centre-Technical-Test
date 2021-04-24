# Flight-Centre-Technical-Test
Technical Test repo for Flight Centre job

I have used MVVM architecture for this project.

Architecture explanation:

   Flight data from API is used a Model (Object) 
   
   A single ViewModel file is added in this project to load and save flight data information using API (provided api for test)
   
   Three views (swiftUI files) has been used to show different information.
   
   1- A initial view which show information about all flights using ViewModel to get data and other view to show flight initial information in List format.
   2- A single view which show flight information on initial view.
   
   3. Detail view for flight detail information (missing information about terminal, seat & gate)

Only challenge that I have face is parsing data for different views such:

    Formatting Date and Time
    
    Formatting Schedule Duration of flights
    
 Understanding different date & time formats make it easy for me to overcome this challenge and added functions/methods for its reusability.
 
 
 I have used SwiftyJSON library for parsing JSON data to get detailed information of flight and stored as object/Model "Flight" for its reusability & Testability.

