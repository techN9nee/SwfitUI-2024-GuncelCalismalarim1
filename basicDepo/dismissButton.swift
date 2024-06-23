//
//  dismissButton.swift
//  basicDepo
//
//  Created by Aytek Özgül on 21.06.2024.
//

import SwiftUI

struct dismissButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
            }
        }
    }
}

#Preview {
    dismissButton()
}
