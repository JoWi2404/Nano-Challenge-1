//
//  LengthConvert.swift
//  Nano Challenge 1
//
//  Created by Joey Wiryawan on 08/05/23.
//

import SwiftUI

struct LengthConvert: View {
    
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount : String = ""
    @State private var isClicked = false
    @State private var pickerClicked = false
    let activityIndicator = UIActivityIndicatorView(style: .large)
    private let units = ["METER", "FOOT", "YARD", "INCH"]
    
    private let exampleUnit = [UnitLength.meters, UnitLength.feet, UnitLength.yards, UnitLength.inches, UnitLength.millimeters]
    @State private var selectedExample = UnitLength.meters
    
    
    func convert(_ convert: String) -> String{
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedUnit = units[itemSelected]
        let to = units[itemSelected2]
        let meterUnit = ["METER" : 1, "FOOT": 3.281, "YARD": 1.094, "INCH": 39.37]
        
        let footUnit = ["METER" : 3.281, "FOOT": 1, "YARD": 0.333333, "INCH": 12]
        
        let yardUnit = ["METER" : 0.9144, "FOOT": 3, "YARD": 1, "INCH": 36]
        
        let inchUnit = ["METER" : 0.02540002032, "FOOT": 0.0833334, "YARD": 0.0277778, "INCH": 1]
        
        switch (selectedUnit) {
        case "METER" :
            conversion = amount * (meterUnit[to] ?? 0.0)
        case "FOOT" :
            conversion = amount * (footUnit[to] ?? 0.0)
        case "YARD" :
            conversion = amount * (yardUnit[to] ?? 0.0)
        case "INCH" :
            conversion = amount * (inchUnit[to] ?? 0.0)
        default:
            print("Something went wrong!")
        }
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView{
            Form {
                //Input Amount
                Section(header: Text("UNIT CONVERTER").font(.title).foregroundColor(Color.primary)){
                    TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                    //Picker FROM
                    Picker(selection: $itemSelected, label: Text("From")) {
                        ForEach(0 ..< units.count){ index in Text(self.units[index]).tag(index)
                        }
                    }
                   //Picker TO
                    Picker(selection: $itemSelected2, label: Text("To")) {
                        ForEach(0 ..< units.count){ index in Text(self.units[index]).tag(index)
                        }
                    }
                    Picker("Select Unit", selection: $selectedExample, content: {
                        ForEach(exampleUnit, id: \.self, content: { unit in
                            Text(unit.symbol)
                        })
                    })
                }
                //Button
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
                        Text(convert(amount).description)
                    } else {
                        Text("Converted Result")
                            .foregroundColor(Color.secondary)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

struct LengthConvert_Previews: PreviewProvider {
    static var previews: some View {
        LengthConvert()
    }
}
