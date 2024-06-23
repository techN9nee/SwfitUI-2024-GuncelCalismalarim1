//
//  ContentView.swift
//  basicDepo
//
//  Created by Aytek Özgül on 21.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State var mapMekan : Bool = false
    @State var  defterNot : Bool = false
    @State var hesapMak : Bool = false
    var body: some View {
        NavigationStack {
            List {
                
                Button {
                    hesapMak.toggle()
                } label: {
                    Text("Hesap Makinesi")
                }.fullScreenCover(isPresented: $hesapMak, content: {
                    hesapMakinesi()
                })
                Button {
                    mapMekan.toggle()
                } label: {
                    Text("Map kullanımı - Mekan gösterme ")
                }.fullScreenCover(isPresented: $mapMekan, content: {
                    mekanList()
                })
                
                Button {
                    defterNot.toggle()
                } label: {
                    Text("Not Defteri")
                }.fullScreenCover(isPresented: $defterNot, content: {
                    notDefteri()
                })
                




            }.navigationTitle("Uygulamalar")
        }
    }
}

#Preview {
    ContentView()
}
