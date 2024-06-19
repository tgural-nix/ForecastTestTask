//
//  ForecastServiceMock.swift
//  App
//
//  Created by Taras Gural on 19.06.2024.
//

import Foundation
import Combine

final class ForecastServiceMock: ForecastNetworkService {
    func getForecast() -> AnyPublisher<[ForecastItemDTO], Error> {
        Future<[ForecastItemDTO], Error> { promise in
            let item1 = ForecastItemDTO(
                day: "1",
                description: "Sunny",
                sunrise: 0,
                sunset: 0,
                chanceRain: 0,
                high: 0,
                low: 0,
                type: "sunny"
            )

            let item2 = ForecastItemDTO(
                day: "2",
                description: "Lightning",
                sunrise: 0,
                sunset: 0,
                chanceRain: 0,
                high: 0,
                low: 0,
                type: "lightning"
            )

            promise(.success([item1, item2]))
        }.eraseToAnyPublisher()
    }
}
