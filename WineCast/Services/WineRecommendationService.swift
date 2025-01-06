import Foundation

class WineRecommendationService {
    
    static let shared = WineRecommendationService()
    
    private let wines: [Wine] = [
        // <10
        Wine(name: "Syrah/Malbec",
             type: .red,
             description: "A bold red with warming spice and higher tannins. Syrah offers smoky, peppery notes, while Malbec boasts lush dark fruit flavors.",
             pairingNotes: "Pair with hearty stews, braised meats, robust pasta dishes, or strong cheeses.",
             temperatureRange: .below10,
             weatherCondition: nil),
        
        // 10 - 18
        Wine(name: "Pinot Noir/Merlot",
             type: .red,
             description: "A smoother red with moderate tannins and fruit-forward notes. Pinot Noir can be earthy and complex; Merlot is known for lush berry flavors.",
             pairingNotes: "Pair with grilled vegetables, poultry, salmon, or lighter meat-based dishes.",
             temperatureRange: .range10to18,
             weatherCondition: nil),
        
        // 18 - 25
        Wine(name: "Crisp Rosé",
             type: .rose,
             description: "A refreshing, dry rosé perfect for mild temperatures. Expect fruity notes with a bright, tart finish. It's light, versatile, and great for daytime sipping or casual evenings.",
             pairingNotes: "Pair with salads, light pasta, fresh seafood, or Mediterranean dishes.",
             temperatureRange: .range18to25,
             weatherCondition: nil),
        
        // 25 - 35
        Wine(name: "Sauvignon Blanc/Vermentino",
             type: .white,
             description: "A chilled white wine with bright acidity and citrus or herbaceous notes. Sauvignon Blanc offers zingy citrus, while Vermentino adds a hint of salinity.",
             pairingNotes: "Pair with seafood, spicy dishes, fresh cheese plates, or salads.",
             temperatureRange: .range25to35,
             weatherCondition: nil),
        
        // >35°C
        Wine(name: "Prosecco/Cava",
             type: .sparkling,
             description: "Light and refreshing sparkling wine with a touch of effervescence. Features light fruit notes, bubbles, and a crisp finish to cool you down.",
             pairingNotes: "Pair with light appetizers, fruit plates, or salty snacks (like prosciutto & cheese).",
             temperatureRange: .above35,
             weatherCondition: nil),
        
        // Rainy weather
        Wine(name: "Pinot Noir/Gamay",
             type: .red,
             description: "Perfect for rainy days, offering mellow tannins with subtle earthy/cherry notes. Gamay (Beaujolais) is fresh and fruity with a slight spice.",
             pairingNotes: "Pair with mushroom dishes, roasted poultry, or simple pasta.",
             temperatureRange: .range10to18,
             weatherCondition: .rain),
        
        // High humidity
        Wine(name: "Cava/Champagne",
             type: .sparkling,
             description: "Crisp, bubbly wine that cuts through muggy conditions and keeps things light.",
             pairingNotes: "Pair with light canapés, creamy cheeses, or fruit desserts.",
             temperatureRange: .range25to35,
             weatherCondition: .highHumidity)
    ]
    
    func recommendWine(
        temperature: Double,
        isRaining: Bool = false,
        humidity: Double = 0
    ) -> Wine {
        
        if isRaining {
            return wines.first { $0.weatherCondition == .rain }!
        }
        
        if humidity > 70 {
            return wines.first { $0.weatherCondition == .highHumidity }!
        }
        
        return wines.first { wine in
            if let min = wine.temperatureRange.min,
               let max = wine.temperatureRange.max {
                return temperature >= min && temperature <= max
            } else if let max = wine.temperatureRange.max {
                return temperature <= max
            } else if let min = wine.temperatureRange.min {
                return temperature >= min
            }
            return false
        }!
    }
} 
