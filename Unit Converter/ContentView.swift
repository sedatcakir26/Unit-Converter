//
//  ContentView.swift
//  Unit Converter
//
//  Created by Sedat Çakır on 30.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input = 0.0
    @State private var inputUnit = "Celcius"
    @State private var outputUnit = "Kelvin"
    @FocusState private var inputIsFocused : Bool
    
    let units = ["Celcius","Kelvin","Fahrenheit"]
    
    var result : String {
        var defaultUnitCelcius = 0.0
        var resultValue = 0.0
        
        switch inputUnit {
        case "Celcius":
            defaultUnitCelcius = input
        case "Kelvin":
            defaultUnitCelcius = input - 273.15
        case "Fahrenheit":
            defaultUnitCelcius = (input - 32)*(5/9)
        default:
            defaultUnitCelcius = 0
        }
        
        switch outputUnit {
        case "Celcius" :
            resultValue = defaultUnitCelcius
        case "Kelvin":
            resultValue = defaultUnitCelcius + 273.15
        case "Fahrenheit":
            resultValue = defaultUnitCelcius * 1.8 + 32
        default:
            resultValue = 0
            
        }
        let outputString = resultValue.formatted()
        return "\(outputString) \(outputUnit.lowercased())"
        
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("İnput", value: $input, format: .number)
                } header: {
                    Text("Pleaser enter your temperature")
                }
                .keyboardType(.decimalPad).focused($inputIsFocused)
                
                
                Section{
                    Picker("From",selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    Picker("To",selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    Text(result)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Temperature Converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
