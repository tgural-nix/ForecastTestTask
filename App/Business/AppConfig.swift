//
//  AppConfig.swift
//  App
//
//  Created by Taras Gural on 19.06.2024.
//

import Foundation

enum WeatherSource {
    case local, remote
}

final class AppConfig {
    static let weatherSource: WeatherSource = .local
}
