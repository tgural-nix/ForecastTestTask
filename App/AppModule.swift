//
//  AppModule.swift
//  App
//
//

import Global

public class AppModule: Module {
    public static var shared = AppModule()
    private init() {
        // Singleton
    }

    public func registerServices() {
        if AppConfig.weatherSource == .remote {
            GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceImpl() }
        } else {
            GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastServiceMock() }
        }

        GlobalContainer.defaultContainer.register(ForecastService.self) { _ in ForecastServiceImplementation() }
    }
}
