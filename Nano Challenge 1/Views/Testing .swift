//
//  Testing .swift
//  Nano Challenge 1
//
//  Created by Joey Wiryawan on 09/05/23.
//

import SwiftUI

struct Testing_: View {
    
    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    //Selection
    let units = ["Meters", "Feet", "Inches"]
    
    var convertedValue: Double {
        let inputMeasurement = Measurement(value: Double(inputValue) ?? 0, unit: inputUnit == 0 ? UnitLength.meters : inputUnit == 1 ? UnitLength.feet : UnitLength.inches)
        return inputMeasurement.converted(to: outputUnit == 0 ? UnitLength.meters : outputUnit == 1 ? UnitLength.feet : UnitLength.inches).value
    }
    var body: some View {
        NavigationStack{
            Form {
                //Input Amount
                Section(header: Text("Input")) {
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .listRowSeparator(.hidden)
                    Picker(selection: $inputUnit, label: Text("Unit")) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0]).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                //Output Amount
                Section(header: Text("Output")) {
                    Text("\(convertedValue, specifier: "%.2f") \(units[outputUnit])")
                    Picker(selection: $outputUnit, label: Text("Unit")) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0]).tag($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Length Converter")
        }
        .navigationBarTitleDisplayMode(.inline)
//        .preferredColorScheme(.dark)
    }
}
    
    struct Testing__Previews: PreviewProvider {
        static var previews: some View {
            Testing_()
        }
    }

