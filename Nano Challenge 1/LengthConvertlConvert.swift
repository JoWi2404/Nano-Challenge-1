//
//  ManualConvert.swift
//  Nano Challenge 1
//
//  Created by Joey Wiryawan on 03/05/23.
//

import SwiftUI

struct ManualConvert: View {
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount : String = ""
    @State private var isClicked = false
    @State private var pickerClicked = false
    private let currencies = ["CM", "INCH", "FOOT"]
    
    
    func convert(_ convert: String) -> String{
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[itemSelected]
        let to = currencies[itemSelected2]
        
        let sgdRates = ["USD" : 0.75, "SGD": 1, "IDR": 11018.78, "JPY": 101.37]
        let usdRates = ["USD" : 1.0, "SGD": 1.33, "IDR": 14688.75, "JPY": 134.64]
        let idrRates = ["USD" : 0.000068, "SGD": 0.000091, "IDR": 1.0, "JPY": 0.0092]
        let jpyRates = ["USD" : 0.0074, "SGD": 0.00099, "IDR": 109.18, "JPY": 1.0]
        
        switch (selectedCurrency) {
        case "USD" :
            conversion = amount * (usdRates[to] ?? 0.0)
        case "SGD" :
            conversion = amount * (sgdRates[to] ?? 0.0)
        case "IDR" :
            conversion = amount * (idrRates[to] ?? 0.0)
        case "JPY" :
            conversion = amount * (jpyRates[to] ?? 0.0)
        default:
            print("Something went wrong!")
        }
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView{
            Form {
                //Input Amount
                Section(header: Text("CONVERTER").font(.title).foregroundColor(Color.primary)){
                    TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker(selection: $itemSelected, label: Text("From")) {
                        ForEach(0 ..< currencies.count){ index in Text(self.currencies[index]).tag(index)
                        }
                    }
                    //.pickerStyle(.wheel)
                    Picker(selection: $itemSelected2, label: Text("To")) {
                        ForEach(0 ..< currencies.count){ index in Text(self.currencies[index]).tag(index)
                        }
                    }
                }
                
                Button{
                    isClicked = true
                } label: {
                    Text("Convert!")
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                }
                //disable button if amount is empty
                .disabled(amount.isEmpty)
                
                //Conversion Result
                Section(header: Text("Conversion")){
                    if isClicked == true {
                        Text("\(convert(amount)) \(currencies[itemSelected2])")
                    } else {
                        Text("Converted Result")
                            .foregroundColor(Color.secondary)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ManualConvert_Previews: PreviewProvider {
    static var previews: some View {
        ManualConvert()
    }
}
