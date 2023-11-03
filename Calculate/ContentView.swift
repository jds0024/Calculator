
//
//  ContentView.swift
//  Calculate
//
//  Created by 정다산 on 10/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputText = "0"
    @State var saveInputText = ""
    @State var opCheck = false
    @State var saveOP = ""
    
    
    
    var buttonTxt = [
        ["AC","/","%","÷"],
        ["7","8","9","X"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0",".","="]
        ]
    
    func btnColor(_ btnValue:String)->Color{
        
        
        switch btnValue {
        case buttonTxt[0][0],
            buttonTxt[0][1] ,
            buttonTxt[0][2]:
            return Color("ACColor")
        case buttonTxt[0][3],
            buttonTxt[1][3],
            buttonTxt[2][3],
            buttonTxt[3][3],
            buttonTxt[4][2]:
            return Color.orange
        default: return Color("numColor")
            
        }
    }
    func zeroCheck(_ btnValue:String)->CGFloat{
        if btnValue == "0"{
            return 140
        }else{
            return 50
        }
    }
    func inInputText(_ btnValue:String){
        
        
        switch btnValue {
        //AC
        case buttonTxt[0][0]:
           inputText = "0"
            opCheck = false
        // /
        case buttonTxt[0][1]:
            saveInputText = inputText
            saveOP = buttonTxt[0][1]
            opCheck = true
        // %
        case buttonTxt[0][2]:
            saveInputText = inputText
            saveOP = buttonTxt[0][2]
            opCheck = true
        // ÷
        case buttonTxt[0][3]:
            saveInputText = inputText
            saveOP = buttonTxt[0][3]
            opCheck = true
        // X
        case buttonTxt[1][3]:
            saveInputText = inputText
            saveOP = buttonTxt[1][3]
            opCheck = true
        // -
        case buttonTxt[2][3]:
            saveInputText = inputText
            saveOP = buttonTxt[2][3]
            opCheck = true
        // +
        case buttonTxt[3][3]:
            saveInputText = inputText
            saveOP = buttonTxt[3][3]
            opCheck = true
        // =
        case buttonTxt[4][2]:
           calc()
            opCheck = true
        default:
            if inputText == "0" && !opCheck  {
                inputText = (btnValue)
            }else if inputText != "0" && !opCheck {
                inputText += (btnValue)
            }
            if opCheck && inputText != "0"{
                
                inputText = btnValue
                opCheck = false
            }
        }
    }
    func calc(){
        if saveInputText != "" && saveOP != ""{
            if let num1 = Int(saveInputText),let num2 = Int(inputText){
                switch saveOP{
                case buttonTxt[0][3]:
                    
                    inputText = String(num1 / num2)
                case buttonTxt[1][3]:
                    
                    inputText = String(num1 * num2)
                case buttonTxt[2][3]:
                    
                    inputText = String(num1 - num2)
                case buttonTxt[3][3]:
                    inputText = String(num1 + num2)
                default:
                    print("Error")
                    print(saveOP)
                    print(buttonTxt[0][3])
                }
                
                }
            
            
        }
    }
    func numColor(_ btnValue:String)->Color{
        switch btnValue{
        case buttonTxt[0][0],
            buttonTxt[0][1],
            buttonTxt[0][2]:
            return Color.black
            
        default:
            return Color.white
            
        }
    }
    
            
    
  
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            
            
            
            Text("\(inputText)")
                .font(.system(size: 80))
                .fontWeight(.light)
                
                
                .foregroundStyle(Color.white)
            
            ForEach(buttonTxt,id:\.self){line in
                
                HStack{
                    ForEach(line,id:\.self){btnValue in
                        
                        Button(action: {inInputText(btnValue)}
                               , label: {
                            Text(btnValue)
                                .font(.system(size: 35))
                                .fontWeight(.medium)
                                .foregroundStyle(numColor(btnValue))
                                
                        })
                        .frame(width:zeroCheck(btnValue),height: 50)
                        .padding()
                        .background(btnColor(btnValue))
                        .cornerRadius(500)
                        .onTapGesture{
                            
                        }
                        
                        
                        
                    }//ForEach2
                }//HStack
                .padding(5)
                
                
            }//Foreach1
            
            
            
            
        }//VStack
        .frame(minWidth: 500)
        .background(Color.black)
        
    }
    
}

#Preview {
    ContentView()
}
