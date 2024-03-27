//
//  ContentView.swift
//  WeatherApp
//
//  Created by Yogeshwar Sharma on 24/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
//                Text("Your co-ordinates are: \(location.longitude),\(location.latitude)")
                if let weather = weather{
                    WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                    }
                }
                
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }
                else{
                    WelcomeView().environmentObject(locationManager)
                    
                }
            }
        }
        .background(Color(.blue))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
