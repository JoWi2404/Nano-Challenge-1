//
//  ContentView.swift
//  Nano Challenge 1
//
//  Created by Joey Wiryawan on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Testing_()
                .tabItem {
                    Label("Length", systemImage: "ruler.fill")
                }
            TemperatureConverter()
                .tabItem {
                    Label("Temperature", systemImage: "drop.degreesign.fill")
                }
            APIConvert()
                .tabItem {
                    Label("Currency", systemImage: "dollarsign.arrow.circlepath")
                }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

