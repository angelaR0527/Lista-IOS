//
//  TareaView.swift
//  AngelaIOS
//
//  Created by ANGELA ROGEL GONZALEZ on 20/1/25.
//

import SwiftUI

struct TareaView: View {
    let tarea: Tarea
    @State var checked : Bool = false
    var body: some View {
        HStack{
            Checkbox(checked : $checked)
                .cornerRadius(5)
                .padding()
                .frame(width: 20, height:20)
            Text(tarea.title)
                .font(.headline)
                .lineLimit(1)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct Tarea: Identifiable {
    let id = UUID()
    let title: String
}

struct TareaView_Previews: PreviewProvider {
    static var previews: some View {
        TareaView(tarea: Tarea(title: "Comprar skincare"))
    }
}
