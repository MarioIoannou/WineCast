import Foundation

class WineRecommendationService {
    
    static let shared = WineRecommendationService()
    
    private let wines: [Wine] = [
        // <5
        Wine(name: "Barolo / Bordeaux / Amarone",
             type: .red,
             description: """
                     Short & Sweet: These are bold, full-bodied reds known for depth and complexity.
                     
                     Barolo (Italy): Famous for tar-and-roses aroma, firm tannins, and lively acidity.
                     
                     Bordeaux (France): Often blends of Cabernet Sauvignon, Merlot, and more, with dark fruit flavors.
                     
                     Amarone (Italy): Rich and velvety, with dried fruit notes and a hint of sweetness from partially dried grapes.
                     
                     Learn More:
                     
                     - Barolo often needs decanting to soften tannins and reveal floral notes.
                     - Bordeaux can range from simple table wine to ultra-premium; typical flavors include blackcurrant and cedar. 
                     - Amarone is made via the appassimento method (drying grapes before fermentation), resulting in concentrated flavors.
                     """,
            pairingNotes: """
                     Perfect for very cold weather and hearty dishes:
                     - Rich stews (beef bourguignon), braised short ribs, or venison.
                     - Aged hard cheeses (like Parmigiano-Reggiano or Pecorino).
                     - The warming nature of these wines complements the chill in the air.
                     """,
             temperatureRange: .below5,
             weatherCondition: nil),
        
        // 5 - 10
        Wine(name: "Syrah / Malbec / Cabernet Sauvignon",
             type: .red,
             description: """
                     Short & Sweet: Hearty reds that bring warmth without the intensity of ultra-full-bodied wines.
                     
                     Syrah (aka Shiraz): Smoky, peppery, with dark berry notes.
                     
                     Malbec: Smooth tannins, juicy black plum, and sometimes a hint of cocoa.
                     
                     Cabernet Sauvignon: Bold structure, blackcurrant, and subtle oak (if barrel-aged).
                     
                     Learn More:
                     
                     - Syrah vs. Shiraz: Same grape, different naming depending on the region and style. 
                     - Malbec thrives in higher altitudes (like Argentina), developing bright acidity. 
                     - Cabernet Sauvignon is often blended but can stand alone with powerful tannic backbone.
                     """,
            pairingNotes: """
                     - Slow-cooked meats (lamb shanks, beef chili).
                     - Hearty pastas with robust sauces (ragù Bolognese).
                     - Smoky BBQ dishes or grilled veggies if you like a smoky edge.
                     """,
             temperatureRange: .range5to10,
             weatherCondition: nil),
        
        // 10 - 15
        Wine(name: "Pinot Noir / Garnacha / Gamay",
             type: .red,
             description: """
                     Short & Sweet: Mellow reds with medium body, softer tannins, and bright fruit flavors.
                     
                     Pinot Noir: Silky texture, red cherry, light earthy notes.
                     
                     Garnacha (Grenache): Fruity, sometimes spicy, can show strawberry or raspberry.
                     
                     Gamay (e.g., Beaujolais): Light, fresh, and quaffable with cranberry or red berry notes.
                     
                     Learn More:
                     
                     - Pinot Noir is known for elegance; it can show mushroom/forest floor aromas when aged. 
                     - Garnacha can handle a bit of spice in foods. 
                     - Gamay is often served slightly chilled, making it very food-friendly.
                     """,
            pairingNotes: """
                     - Roast chicken, duck, or turkey.
                     - Mushroom dishes (risotto, stuffed mushrooms).
                     - Simple pastas (light tomato or pesto sauces).
                     - Because of the soft tannins, these wines won’t overpower lightly flavored foods.
                     """,
             temperatureRange: .range10to15,
             weatherCondition: nil),
        
        // 15 - 20
        Wine(name: "Merlot / Sangiovese / Zinfandel",
             type: .red,
             description: """
                     Short & Sweet: Medium-bodied reds with approachable tannins and food-friendly acidity.
                     
                     Merlot: Plush berry flavors, gentle structure.
                     
                     Sangiovese (e.g., Chianti): Bright cherry, high acidity, hint of herbs.
                     
                     Zinfandel (esp. from California): Jammy berry fruit, sometimes a spicy finish.
                     
                     Learn More:
                     
                     - Merlot is often a crowd-pleaser; great for those new to reds. 
                     - Sangiovese is Italy’s most planted grape; perfect with tomato-based dishes. 
                     - Zinfandel can be higher in alcohol, bringing warmth to cooler evenings.
                     """,
            pairingNotes: """
                     - Tomato-based pastas (spaghetti Bolognese or marinara).
                     - Pizza, grilled vegetables, or lighter red meat dishes.
                     - Medium-hard cheeses (like cheddar or Gouda).
                     """,
             temperatureRange: .range15to20,
             weatherCondition: nil),
        
        // 20 - 25
        Wine(name: "Crisp Rosés & Chillable Reds (Rosé / Lambrusco / Light Cinsault)",
             type: .rose,
             description: """
                     Short & Sweet: Moderate weather calls for refreshing, lighter wines with a bit of chill.
                     
                     Dry Rosé: Think strawberry, raspberry, and citrus notes.
                     
                     Lambrusco (lightly sparkling red from Italy): Fruity with a bit of fizz.
                     
                     Light Cinsault: A softly perfumed red that can be chilled.
                     
                     Learn More:
                     
                     - Rosé styles vary from very pale Provence to deeper pink Spanish rosados. 
                     - Lambrusco ranges from dry to sweet; secco (dry) versions are food-friendly. 
                     - Chilled reds are trending; a quick 30-minute chill makes them great for warm days.
                     """,
            pairingNotes: """
                     - Salads, charcuterie boards, or grilled fish.
                     - Lambrusco pairs surprisingly well with pizza or cured meats.
                     - Picnic-friendly: sandwiches, wraps, or light tapas.
                     """,
             temperatureRange: .range20to25,
             weatherCondition: nil),
        
        // 25 - 30
        Wine(name: "Sauvignon Blanc / Albariño / Dry Riesling",
             type: .white,
             description: """
                     Short & Sweet: Crisp whites with high acidity to combat the heat.
                     
                     Sauvignon Blanc: Zesty citrus, grassy or gooseberry notes.
                     
                     Albariño (Spain): Peach, apricot, subtle salinity.
                     
                     Dry Riesling: Lime, green apple, sometimes mineral/floral accents.
                     
                     Learn More:
                     
                     - Sauvignon Blanc from New Zealand is famously pungent and tropical, while Loire Valley versions are more minerally. 
                     - Albariño thrives in coastal Galicia; it’s often described as refreshing as a sea breeze. 
                     - Dry Riesling can be misunderstood—it's not always sweet! Look for "Trocken" on German labels.
                     """,
            pairingNotes: """
                     - Seafood (shrimp, mussels), salads, or mildly spiced cuisine.
                     - Great with goat cheese or other tangy cheeses.
                     - The high acidity cuts through oily or fried foods too.
                     """,
             temperatureRange: .range25to30,
             weatherCondition: nil),
        
        // 30 - 35
        Wine(name: "Vermentino / Pinot Grigio / Grüner Veltliner",
             type: .white,
             description: """
                     Short & Sweet: In hot weather, pick thirst-quenching whites that aren’t too heavy.
                     
                     Vermentino (Italy): Citrus, white flowers, slight bitterness on the finish (in a good way).
                     
                     Pinot Grigio (Italy) or Pinot Gris (France): Light, crisp, notes of pear, green apple.
                     
                     Grüner Veltliner (Austria): Lime, green pepper, and a signature white pepper spice.
                     
                     Learn More:
                     
                     - Vermentino is common in Sardinia and Tuscany, sometimes showing a seaside salinity. 
                     - Pinot Grigio from northern Italy is typically very light; Alsace Pinot Gris is richer. 
                     - Grüner Veltliner can range from simple and citrusy to complex and age-worthy.
                     """,
            pairingNotes: """
                     - Grilled chicken or fish, antipasti, or mild cheeses.
                     - Crisp veggies like zucchini, peppers, or salad-based dishes.
                     - A crowd-pleaser at outdoor gatherings or pool parties.
                     """,
             temperatureRange: .range25to30,
             weatherCondition: nil),
        
        // >35
        Wine(name: "Prosecco / Cava / Moscato d’Asti",
             type: .sparkling,
             description: """
                     Short & Sweet: When it’s scorching, bubbly is the perfect way to cool off.
                     
                     Prosecco (Italy): Light, frothy, green apple and pear notes.
                     
                     Cava (Spain): Crisp, citrusy, with finer bubbles and a toasty hint from aging.
                     
                     Moscato d’Asti (Italy): Slightly sweet, low in alcohol, bursting with peach and floral aromas.
                     
                     Learn More:
                     
                     - Prosecco generally uses the Glera grape; look for DOCG for top quality. 
                     - Cava is made in the traditional method like Champagne, so it can have brioche or nutty flavors. 
                     - Moscato d’Asti is gently sparkling (frizzante) and typically sweet or off-dry—a delightful dessert or brunch wine.
                     """,
            pairingNotes: """
                     - Chilled appetizers, fresh fruit, or salty snacks (prosciutto, olives, cheese).
                     - Spritz cocktails (Aperol Spritz with Prosecco) or Bellinis (peach puree + Prosecco).
                     - Moscato d’Asti pairs beautifully with fruit tarts, pastries, or mild cheeses.
                     """,
             temperatureRange: .above35,
             weatherCondition: nil),
        
        // Rainy Weather
        Wine(name: "Pinot Noir / Gamay / Light Merlot",
             type: .red,
             description: """
                     Short & Sweet: On a rainy day, a smooth, medium-bodied red feels cozy.
                     
                     Pinot Noir: Earthy, cherry notes that match the mood.
                     
                     Gamay (Beaujolais): Fruity, lively, easy to sip.
                     
                     Light Merlot: Round mouthfeel, moderate tannins, comforting warmth.
                     
                     Learn More:
                     
                     - Pinot Noir can reveal layers of mushroom or forest floor, perfect for a drizzly afternoon. 
                     - Gamay is fun lightly chilled; it can lift your spirits on a gray day. 
                     - Merlot from cooler regions (like Bordeaux’s Right Bank) can show complexity without overwhelming strength.
                     """,
            pairingNotes: """
                     - Mushroom risotto or creamy pasta dishes.
                     - Roasted poultry (chicken, turkey), or a simple charcuterie plate.
                     - These wines strike a balance between warm and elegant for cozy indoor time.
                     """,
             temperatureRange: .range10to15,
             weatherCondition: .rain),
        
        // High Humidity
        Wine(name: "Champagne (Brut) / Cava / Extra-Dry Sparkling Rosé",
             type: .sparkling,
             description: """
                     Short & Sweet: In muggy, sticky weather, crisp and bubbly wines are ultra-refreshing.
                     
                     Brut Champagne (France): Fine bubbles, notes of green apple, lemon, toasty brioche.
                     
                     Cava (Spain): Zesty citrus, floral hints, often more budget-friendly than Champagne.
                     
                     Extra-Dry Rosé: Fruity and floral, but still bright enough to cleanse the palate.
                     
                     
                     Learn More:
                     - Brut indicates very dry; perfect if you don’t want added sweetness in the heat. 
                     - Cava uses native Spanish grapes like Macabeo, Xarel·lo, Parellada in the traditional method. 
                     - Sparkling Rosé can be made from Pinot Noir or other red grapes, giving it that pink hue.
                     """,
            pairingNotes: """
                     - Light canapés (crackers with goat cheese, smoked salmon).
                     - Fresh fruit desserts (strawberries, peaches), or just cut fruit.
                     - The bubbles and acidity cut through humidity, making each sip crisp and invigorating.
                     """,
             temperatureRange: .range25to30,
             weatherCondition: .highHumidity),
        
        // Low Humidity
        Wine(name: "Chenin Blanc / Soave / Dry Furmint",
             type: .white,
             description: """
                 Short & Sweet: In hot, dry conditions, look for white wines with some fruit depth and vibrant acidity.
                 
                 Chenin Blanc (Loire, South Africa): Can be dry or off-dry, with notes of pear, quince, and honey.
                 
                 Soave (Italy): Typically made from Garganega grapes, showing citrus, almond, and a subtle floral aroma.
                 
                 Dry Furmint (Hungary): Zippy acidity, flavors of green apple and lemon, sometimes a hint of smoke or minerality.

                 Learn More:
                 
                 - Chenin Blanc is famously versatile—found in sparkling, sweet, and dry styles. Dry versions can be crisp and refreshing, with a slight waxy texture.
                 - Soave is known for its elegant balance of fruit, acidity, and faint nuttiness. Look for “Soave Classico” from hillside vineyards for more complexity.
                 - Furmint is the main grape of Tokaj (often known for sweet wines), but the dry versions are increasingly popular—fresh, mineral-driven, and food-friendly.
                 """,
                 pairingNotes: """
                 - Grilled chicken skewers, summer salads, or mildly spiced Asian dishes.
                 - Soft to semi-firm cheeses (like young Gouda or Havarti).
                 - Great with Mediterranean mezze (hummus, falafel, roasted eggplant).
                 """,
             temperatureRange: .range30to35,
             weatherCondition: .lowHumidity),
        
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
        
        if humidity < 40 {
            return wines.first { $0.weatherCondition == .lowHumidity }!
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
