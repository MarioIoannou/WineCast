import Foundation

struct Wine: Identifiable {
    
    let id = UUID()
    let name: [String]
    let type: WineType
    let description: [String]
    let pairingNotes: [String]
    let learnMore: [String]
    let temperatureRange: TemperatureRange
    let weatherCondition: WeatherCondition?
    let servingTemperature: String
    let recommendedGlassware: String
    let agingPotential: String
    let quickFacts: [String]
    
    enum WineType {
        
        case red
        case white
        case rose
        case sparkling
    }
    
    enum WeatherCondition {
        
        case rain
        case highHumidity
        case lowHumidity
    }
    
    struct TemperatureRange {
        
        let min: Double?
        let max: Double?
        
        static let below5 = TemperatureRange(min: nil, max: 5)
        static let range5to10 = TemperatureRange(min: 5, max: 10)
        static let range10to15 = TemperatureRange(min: 10, max: 15)
        static let range15to20 = TemperatureRange(min: 15, max: 20)
        static let range20to25 = TemperatureRange(min: 20, max: 25)
        static let range25to30 = TemperatureRange(min: 25, max: 30)
        static let range30to35 = TemperatureRange(min: 30, max: 35)
        static let above35 = TemperatureRange(min: 35, max: nil)
    }
} 
