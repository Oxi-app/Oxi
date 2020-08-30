//
//  ModalView.swift
//  Oxi
//
//  Created by Nishan Dudakia on 15/07/2020.
//  Copyright © 2020 Oxi. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    @State var selectedDate = Date()

    
    var body: some View {
        VStack {
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Text("\(selectedDate)")
        }
        
    }
}



struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
