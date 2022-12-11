//
//  ContentView.swift
//  TakeHomeTestSwiftUI
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var currentColorScheme
    @State private var currentCardIndex: Int = 1
    
    let contents = cardViews

    var body: some View {
        VStack {
            HeaderView()
            CardView(content: contents[currentCardIndex])
            Spacer()
        }
        .onTapGesture {
            currentCardIndex = (currentCardIndex + 1) % contents.count
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("What's new in SwiftUI?")
                .font(.system(.largeTitle, design: .rounded, weight: .black))
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}
