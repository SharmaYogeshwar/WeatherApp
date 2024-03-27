//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by Yogeshwar Sharma on 25/03/24.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 8){
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Preview: PreviewProvider{
    static var previews: some View{
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
