//
//  DetailViewModel.swift
//  App
//
//

import Foundation

final class DetailViewModel: ObservableObject {
    var forecastItem: ForecastItem

    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
    }
}
