//
//  ForecastServiceImplementation.swift
//  App
//
//  Created by Taras Gural on 18.06.2024.
//

import Foundation
import Combine
import Global

final class ForecastServiceImplementation: ForecastService {
    @Inject private var forecastNetworkService: ForecastNetworkService
    private let itemsSubject = CurrentValueSubject<ForecastItems, Never>([])
    private var cancellables = Set<AnyCancellable>()
    var items: AnyPublisher<ForecastItems, Never> {
        itemsSubject.eraseToAnyPublisher()
    }

    func getForecast() {
        forecastNetworkService.getForecast()
            .map { items -> [ForecastItem] in
                items.map(ForecastItem.init)
            }
            .replaceError(with: [])
            .sink { [weak self] items in
                self?.itemsSubject.send(items)
            }.store(in: &cancellables)
    }

    func deleteForecast(item: ForecastItem) {
        guard let index = itemsSubject.value.firstIndex(where: { $0.day == item.day }) else {
            return
        }
        itemsSubject.value.remove(at: index)
    }
}
