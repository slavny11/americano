//
//  RowView.swift
//  AmericanoChallenge
//
//  Created by Viacheslav on 17/11/22.
//

import SwiftUI

struct RowView: View {
    
    let input: Input
    
    var body: some View {
        
        let amount = String(format: "%.2f", input.amount)
        
        HStack {
            Image(systemName: input.imageName ?? "fork.knife")

                .padding(.trailing, 2)
            VStack (alignment: .leading) {
                Text(input.category ?? "Unknown category")
                    .font(.headline)
                Text(input.account ?? "Unknown account")
                    .font(.caption2)
                Text(input.timestamp!, format: .dateTime.hour().minute())
                    .font(.caption2)
            }
            Spacer()
            Text("\(input.currency ?? "Ee")" + "\(amount)")
                .font(.headline)
        }
    }
}

//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView(input: Input)
//    }
//}
