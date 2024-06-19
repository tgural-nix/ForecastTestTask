//
//  DetailView.swift
//  App
//
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            if let imageName = viewModel.forecastItem.weatherTypeImageName {
                Image(imageName)
                    .renderingMode(.template)

                    .foregroundStyle(.white)
            }
            Text(viewModel.forecastItem.day)
                .foregroundStyle(.white)
            Text(viewModel.forecastItem.description)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.background))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
