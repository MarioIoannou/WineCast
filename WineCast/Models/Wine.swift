import Foundation

struct Wine: Identifiable {
    
    let id = UUID()
    let name: String
    let type: WineType
    let description: String
    let pairingNotes: String
    let temperatureRange: TemperatureRange
    let weatherCondition: WeatherCondition?
    
    enum WineType {
        
        case red
        case white
        case rose
        case sparkling
    }
    
    enum WeatherCondition {
        
        case rain
        case highHumidity
    }
    
    struct TemperatureRange {
        
        let min: Double?
        let max: Double?
        
        static let below10 = TemperatureRange(min: nil, max: 10)
        static let range10to18 = TemperatureRange(min: 10, max: 18)
        static let range18to25 = TemperatureRange(min: 18, max: 25)
        static let range25to35 = TemperatureRange(min: 25, max: 35)
        static let above35 = TemperatureRange(min: 35, max: nil)
    }
} 
