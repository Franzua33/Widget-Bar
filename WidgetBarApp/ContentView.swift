//
//  ContentView.swift
//  WidgetBarApp
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    
    var data = ["yy": 20.0,"xy":30.0, "xx":50.0 ]
    
    
    var body: some View {
        
        
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.4))
            Text("$ Dolar Tendency").font(.caption).fontWeight(.bold).foregroundColor(Color.green).colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            HStack {
                
                ForEach(data.keys.sorted(), id: \.self){ key in
                    VStack {
                        
                        Spacer()
                        Rectangle()
                            .fill(Color.red).frame(height: data[key] ?? 1.0)
                        Text(key)
                             
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 14 Pro Max")
            .preferredColorScheme(.dark)
            ContentView()
                .previewDevice("iPhone SE (3rd generation)")
                .preferredColorScheme(.light
                )
        }
    }
}
