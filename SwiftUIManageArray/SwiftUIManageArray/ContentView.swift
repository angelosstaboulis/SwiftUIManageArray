//
//  ContentView.swift
//  SwiftUIManageArray
//
//  Created by Angelos Staboulis on 22/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var currentItem:Int
    @State var selectedRow:Int
    @State var array:[Int]=[Int.random(in: 0..<2250),Int.random(in:0..<2250),Int.random(in:0..<2250),Int.random(in:0..<2250)]
    var body: some View {
        ZStack{
            Text("SwiftUIManageArray").padding(EdgeInsets(top: -30, leading: -5, bottom: 30, trailing: -35))
            HStack{
                Button(action: {
                    array.removeAll()
                    for _ in 0..<4{
                        array.append(Int.random(in: 0..<2250))
                    }
                }, label: {
                    Text("Reload")
                })
            }.padding(EdgeInsets(top: 50, leading: -25, bottom: 30, trailing: 50))
            HStack{
                Button(action: {
                    array.sort()
                }, label: {
                    Text("Sort")
                })
            }.padding(EdgeInsets(top: 50, leading: -115, bottom: 30, trailing: 100))
            HStack{
                Button(action: {
                    currentItem = array.firstIndex(of: array[0])!
                    array.remove(at: currentItem)
                    array.insert(Int.random(in: 0..<2250), at: 0)
                }, label: {
                    Text("Insert")
                })
            }.padding(EdgeInsets(top: 50, leading: 155, bottom: 30, trailing: 70))
            HStack{
                Button(action: {
                    array.reverse()
                }, label: {
                    Text("Reverse")
                })
            }.padding(EdgeInsets(top: 50, leading: 215, bottom: 30, trailing: -15))
        }
      
    List{
    ForEach(0..<array.count){ row in
    Text(String(array[row])).onTapGesture(perform: {
        selectedRow = row
        currentItem = array.firstIndex(of: array[row])!
        array.remove(at: currentItem)
        array.insert(Int.random(in: 0..<2250), at: row)
    }).listRowBackground(Rectangle().fill()).foregroundColor(selectedRow == row ? .blue : .black)
    }
    }.background(Rectangle().fill()).foregroundColor(.white)
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentItem: -1, selectedRow: -1)
    }
}
