//
//  ForecastItem.swift
//  App
//
//

import Foundation

struct ForecastItem { 
    enum WeatherType: String {
        case sunny
        case lightning
        case rain
        case overcast
        case windy
        case showers
        case undefined
    }
    let weatherType: WeatherType
    let day: String
    let description: String
    var weatherTypeImageName: String? {
        switch weatherType {
        case .undefined: return nil
        default: return weatherType.rawValue
        }
    }

    init(dto: ForecastItemDTO) {
        self.day = dto.day
        self.description = dto.description
        self.weatherType = WeatherType(rawValue: dto.type) ?? .undefined
    }

    init(
        day: String,
        description: String,
        weatherType: WeatherType
    ) {
        self.day = day
        self.description = description
        self.weatherType = weatherType
    }
}

typealias ForecastItems = [ForecastItem]
