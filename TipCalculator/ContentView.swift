//
//  ContentView.swift
//  TipCalculator
//
//  Created by Mohammad Azam on 9/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    
    let tipCalculator = TipCalculator()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                
                Picker(selection: $tipPercentage) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)

                
                Button("Calculate Tip") {
                  
                    tip = ""
                    message = ""
                    
                    guard let totalAmount = Double(total) else {
                        message = "Care to enter any number?"
                        return
                    }
                    
                    do {
                        let result = try tipCalculator.calculate(total: totalAmount, percentage: tipPercentage)
                        
                        let numberFormatter = NumberFormatter()
                        numberFormatter.numberStyle = .currency
                        tip = numberFormatter.string(from: NSNumber(value: result))
    
                    } catch TipCalculatorError.invalidInput {
                        message = "How can total amount be less than 0?"
                    } catch {
                        message = error.localizedDescription
                    }
                    
                }.padding(.top, 20)
                
                Text(message)
                    .padding(.top, 50)
                    .foregroundColor(.red)
                
                Spacer()
                
                Text(tip ?? "")
                    .font(.system(size: 54))
                
                Spacer()
                .navigationTitle("Tip Calculator")
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
