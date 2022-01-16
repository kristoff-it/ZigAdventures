//
//  ContentView.swift
//  ZigAdventures
//
//  Created by Loris Cro on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(String(cString: helloFromZig()))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
