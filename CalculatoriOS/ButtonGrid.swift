//
//  ButtonGrid.swift
//  CalculatoriOS
//
//  Created by Bineta Diatta on 6/9/25.
//

import SwiftUI


enum CalcMode{
    case notSet
    case addition
    case subtraction
    case multiplication
}

struct ButtonGrid: View {
    
    @Binding var total : String
    @State var currentMode: CalcMode = .notSet
    @State var lastButtonWasMode: Bool = false
    @State var savedInt = 0
    @State var currentInt = 0
    var body: some View {
        Grid{
            GridRow{
                CalcButtonView(buttonText: "1", action: numberPressed)
                CalcButtonView(buttonText: "2",action: numberPressed)
                CalcButtonView(buttonText: "3",action: numberPressed)
                CalcButtonView(buttonText: "+", buttonColor: .orange, action: modePressed, mode: .addition)
            }
            GridRow{
                CalcButtonView(buttonText: "4",action: numberPressed)
                CalcButtonView(buttonText: "5",action: numberPressed)
                CalcButtonView(buttonText: "6",action: numberPressed)
                CalcButtonView(buttonText: "-", buttonColor: .orange, action: modePressed, mode: .subtraction          )}
            GridRow{
                CalcButtonView(buttonText: "7", action: numberPressed)
                CalcButtonView(buttonText: "8", action: numberPressed)
                CalcButtonView(buttonText: "9", action: numberPressed)
                CalcButtonView(buttonText: "x", buttonColor: .orange, action: modePressed, mode: .multiplication)
            }
            GridRow{
                CalcButtonView(buttonText: "0", width: 147, action: numberPressed)
                    .gridCellColumns(2)
                CalcButtonView(buttonText: "C", buttonColor: .gray, action: clearPressed)
                CalcButtonView(buttonText: "=", buttonColor: .orange, action: equalPressed)
                
            }
        }
        .padding()
    }
    
    func numberPressed(button: CalcButtonView){
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentInt = 0
        }
        if let totalInt = Int("\(currentInt)" + (button.buttonText)){
            currentInt = totalInt
            updateText()
        }else{
           total = "Error"
            currentInt = 0
            savedInt = 0
            currentMode = .notSet
            lastButtonWasMode = false
            
        }
        
       
    }
    func modePressed(button: CalcButtonView){
        if currentMode != .notSet && !lastButtonWasMode{
            if currentMode == .addition{
                savedInt += currentInt
            }else if currentMode == .subtraction{
                savedInt -= currentInt
            }else if currentMode == .multiplication{
                savedInt *= currentInt
            }
            currentInt = savedInt
            updateText()
        }else{
            savedInt = currentInt
        }
        currentMode = button.mode
        lastButtonWasMode = true
    }
    func clearPressed(button: CalcButtonView){
        var totalInt = 0;
        total = "\(totalInt)"
        currentInt = 0
        lastButtonWasMode = false
        totalInt = 0
        savedInt = 0
    }
    func equalPressed(button: CalcButtonView){
        if lastButtonWasMode || currentMode == .notSet{
            return
        }
        if currentMode == .addition{
            savedInt += currentInt
        }else if currentMode == .subtraction{
            savedInt -= currentInt
        }else if currentMode == .multiplication{
            savedInt *= currentInt
        }
        
        currentInt = savedInt
        updateText()
        currentMode = .notSet
        lastButtonWasMode = true
    }
    
    func updateText(   ){
        if currentMode == .notSet{
            savedInt = currentInt
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        total = formatter.string(for: currentInt) ?? "Error"
        total = "\(currentInt)"
    }
    
    }


#Preview {
    ButtonGrid(total: .constant("0"))
}
