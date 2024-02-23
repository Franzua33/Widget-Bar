//
//  WidgetBar.swift
//  WidgetBar
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 16/02/24.
//

import WidgetKit
import SwiftUI

//MODELO

struct Modelo : TimelineEntry {
    var date: Date
    var value : Int
    var stadistic: [String:Double]

}


struct Data {
    
//    var colorBar : Color
    
    func dictionaryData() -> [String:Double] {
        
        var myDictionary : Modelo
        
        myDictionary = Modelo(date: Date(), value: 0, stadistic: ["":0.0])
        
        myDictionary.stadistic = ["yy": 50.0,"xy":30.0, "xx":50.0 ]
        
        return myDictionary.stadistic
    }
    
}



//PROVIDER

struct Provider : TimelineProvider {
    
    var data : Data
    
    func placeholder(in context: Context) -> Modelo {
        return Modelo(date: Date(), value: 0, stadistic: ["":0.0])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (Modelo) -> Void) {
        completion(Modelo(date: Date(),value: 0, stadistic: ["":0.0]))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Modelo>) -> Void) {
        
        
        
        let barStadistic = Entry(date: Date(), value: 4, stadistic: data.dictionaryData())
        
        completion(Timeline(entries: [barStadistic], policy: .never))
    }
    
    typealias Entry = Modelo
     
}
//VISTA

struct MyViewBar: View {
    
    var entry : Provider.Entry
    
    var data : Data
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.2))
            VStack {
                Spacer(minLength: 20.0)
                Text("$ Dolar Tendency").bold()
                Text(Date(), style: .time)
                Spacer()
                ExtractedView(data: data)
            }
        }
    }
}


//CONFIGURACION
@main
struct configWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "widgetBar", provider: Provider(data: Data())) { entry in
            MyViewBar(entry: entry, data: Data())
        }.description("My Widget Bar Description")
            .configurationDisplayName("Widget bar")
    }
}

struct ExtractedView: View {
    
    var data : Data
    
    var body: some View {
        HStack {
            ForEach(data.dictionaryData().keys.sorted(), id: \.self){ key in
                VStack {
                    
                    Spacer()
                    Rectangle()
                        .fill(Color.blue).frame(height: data.dictionaryData()[key] ?? 1.0)
                    
                    //                     Text("Valor: \(data[key] ?? 1)")
                    Text(key)
                }
            }
        }.padding()
    }
}
