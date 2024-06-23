//
//  hesapMakinesi.swift
//  basicDepo
//
//  Created by Aytek Özgül on 21.06.2024.
//

import SwiftUI

struct hesapMakinesi: View {
    @State var num1 : String = ""
    @State var num2 : String = ""
    @State var islem : String = ""
    @State var topla : String = ""
    var body: some View {
        NavigationStack {
            VStack{
                
                if !topla.isEmpty {
                    Text("Sonuç: \(topla)")
                        .font(.largeTitle)
                        .bold()
                        .italic()
                }
                TextField("Sayı Giriniz!", text: $num1)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                Picker("Picker", selection: $islem) {
                    Text("+").tag("+")
                    Text("-").tag("-")
                    Text("*").tag("*")
                    Text("/").tag("/")
                }.pickerStyle(SegmentedPickerStyle())
                TextField("Sayı Giriniz!", text: $num2)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                Button {
                    if !num1.isEmpty  && !num2.isEmpty {
                        self.topla = islemYapalim(num1: num1, num2: num2, islem: islem)
                    }

                } label: {
                    Text("Hesapla")
                }.padding()
                    .foregroundStyle(.white)
                    .background(Color.blue)
                    .cornerRadius(10)

            }.toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    dismissButton()
                }
            })
        }
    }
    func islemYapalim(num1:String,num2:String,islem:String) -> String {
        let number1 = Int(num1) ?? 0
        let number2 = Int(num2) ?? 0
        
        switch islem {
        case "+":
            return String(number1 + number2)
        case "-":
            return String(number1 - number2)
        case "*":
            return String(number1 * number2)
        case "/":
            return String(number1 / number2)
        default:
            return "sayı giriniz"
        }
    }
}







#Preview {
    hesapMakinesi()
}
