//
//  notDefteri.swift
//  basicDepo
//
//  Created by Aytek Özgül on 21.06.2024.
//

import SwiftUI

struct notDefteri: View {
    @State var not: String = ""
    @State var notlar: [String] = []
    @State var notSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(notlar, id: \.self) { not in
                        Text(not)
                    }
                    .onMove(perform: { indices, newOffset in
                        notlar.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        notlar.remove(atOffsets: indexSet)
                    })
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing) {
                    HStack{
                        EditButton()
                            .font(.title3)
                        dismissButton()
                    }
                  
                }
            })
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                    Button {
                        notSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .bold()
                    }
                }
            })
        }
        .alert("Hemen not al", isPresented: $notSheet) {
            TextField("Notunuzu giriniz", text: $not)
            Button {
                if !not.isEmpty {
                    notlar.append(not)
                    not = ""
                    notSheet = false
                }
            } label: {
                Text("Not Al")
            }
        }
    }
}

#Preview {
    notDefteri()
}
