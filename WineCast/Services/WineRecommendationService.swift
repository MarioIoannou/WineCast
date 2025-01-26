import Foundation

class WineRecommendationService {
    
    static let shared = WineRecommendationService()
    
    private let wines: [Wine] = [
        // <5
        Wine(name:["Barolo","Bordeaux","Amarone"],
             type: .red,
             description: [
                "Short & Sweet: Bold, full-bodied reds known for complexity and aging potential.",
                "Barolo (Italy): Famous for tar-and-roses aroma, firm tannins, and lively acidity.",
                "Bordeaux (France): Often blends of Cabernet Sauvignon, Merlot, etc., showing dark fruit and cedar.",
                "Amarone (Italy): Rich, velvety, with dried fruit notes from partially dried grapes."
             ],
             pairingNotes: [
                "Rich stews (beef bourguignon), braised short ribs, venison, or mushroom ragout.",
                "Aged hard cheeses like Parmigiano-Reggiano or Pecorino.",
                "Earthy vegetarian dishes (lentil stew, truffle risotto) also shine."
             ],
             learnMore: [
                "Barolo often needs decanting to soften tannins and reveal floral/spicy nuances.",
                "Bordeaux quality and style can vary widely—Grand Cru Classé wines can age for decades.",
                "Amarone’s appassimento method concentrates sugars, yielding high alcohol and bold flavors."
             ],
             temperatureRange: .below5,
             weatherCondition: nil,
             servingTemperature: "16-18°C (61-64°F)",
             recommendedGlassware: "Large Bordeaux-style glass (captures intense aromas).",
             agingPotential: "Capable of long aging (5–20 years or more, depending on the producer)",
             quickFacts: [
                "Barolo’s tar-and-roses come from norisoprenoids; extended aging adds notes of tobacco and spice.",
                "Bordeaux’s signature dark fruit and cedar often stem from oak aging and Cabernet Sauvignon’s phenolics.",
                "Amarone’s dried fruit character stems from partially drying grapes (appassimento) before fermentation.",
                "These wines often improve with bottle aging, integrating tannins and developing complex secondary aromas."
            ]),
        
        // 5 - 10
        Wine(name: ["Syrah","Malbec","Cabernet Sauvignon"],
             type: .red,
             description: [
                         "Short & Sweet: Hearty reds that bring warmth and satisfying depth.",
                         "Syrah (Shiraz): Smoky, peppery, with dark berry notes.",
                         "Malbec: Smooth tannins, juicy black plum, sometimes cocoa hints.",
                         "Cabernet Sauvignon: Bold structure, blackcurrant, oak nuances if barrel-aged."
                     ],
             pairingNotes: [
                         "Slow-cooked meats (lamb shanks, beef chili), grilled portobello mushrooms.",
                         "Hearty pastas with robust tomato or ragù sauces.",
                         "Smoky BBQ dishes or grilled veggies for added complexity."
                     ],
                     learnMore: [
                         "Syrah vs. Shiraz: same grape, different regional styles/names.",
                         "Malbec thrives at high altitudes in Argentina, developing bright acidity and deep color.",
                         "Cabernet Sauvignon can be varietal or blended (common in Bordeaux) with powerful tannins."
                     ],
             temperatureRange: .range5to10,
             weatherCondition: nil,
             servingTemperature: "14-16°C (57-61°F)",
             recommendedGlassware: "Bordeaux-style glass if you want to focus aromas; universal red glass works too.",
             agingPotential: "Most are enjoyable young (2–5 years), though fine Cabernets can age longer.",
             quickFacts: [
                         "Syrah’s peppery note is linked to rotundone; smoky hints can come from oak or grape skins.",
                         "Malbec’s intense color is due to high anthocyanin content.",
                         "Cabernet Sauvignon’s structure and dark fruit flavors often benefit from oak aging (vanillin, spice).",
                         "Region matters: a cool-climate Syrah might be more peppery; a warm-climate Shiraz more jammy."
                     ]),
        
        // 10 - 15
        Wine(name: ["Pinot Noir","Garnacha","Gamay"],
             type: .red,
             description: [
                         "Short & Sweet: Mellow reds with medium body, softer tannins, bright fruit flavors.",
                         "Pinot Noir: Silky texture, red cherry, light earthy notes.",
                         "Garnacha (Grenache): Fruity, sometimes spicy, with strawberry or raspberry.",
                         "Gamay (Beaujolais): Light, fresh, often featuring cranberry or red berry notes."
                     ],
             pairingNotes: [
                         "Roast chicken, duck, or turkey. Great with grilled salmon, too.",
                         "Mushroom dishes (risotto, stuffed mushrooms), lentil or bean-based stews.",
                         "Pasta with light tomato or pesto sauces. These wines won’t overpower delicate flavors."
                     ],
             learnMore: [
                         "Pinot Noir can develop forest floor or mushroom nuances with age.",
                         "Garnacha handles moderate spice and can show high alcohol if grown in warm regions.",
                         "Gamay is often produced via carbonic maceration, yielding fresh, fruity profiles."
                     ],
             temperatureRange: .range10to15,
             weatherCondition: nil,
             servingTemperature: "12-14°C (53-57°F)",
             recommendedGlassware: "Burgundy-style glass for Pinot Noir, universal glass for Garnacha/Gamay.",
             agingPotential: "Generally best within 2–5 years, though high-end Pinot Noir can age longer.",
             quickFacts: [
                         "Pinot Noir’s delicate tannins and bright acidity give it an elegant, silky mouthfeel.",
                         "Garnacha’s ripe strawberry notes derive from esters formed during fermentation.",
                         "Gamay’s fresh red fruit flavors often come from carbonic maceration, capturing fruity esters.",
                         "Serving Pinot Noir slightly cooler enhances its fruity/earthy balance."
                     ]),
        
        // 15 - 20
        Wine(name: ["Merlot","Sangiovese","Zinfandel"],
             type: .red,
             description: [
                         "Short & Sweet: Medium-bodied reds with approachable tannins and good acidity.",
                         "Merlot: Plush berry flavors, gentle structure.",
                         "Sangiovese (Chianti): Bright cherry, herbal hints, high acidity.",
                         "Zinfandel: Jammy berry fruit, spicy finish, often higher alcohol."
                     ],
                     pairingNotes: [
                         "Tomato-based pastas (spaghetti marinara/Bolognese), pizza, or roasted vegetables.",
                         "Medium-hard cheeses (cheddar, Gouda), veggie burgers, or mushroom pizzas.",
                         "Zinfandel’s bold fruit pairs well with BBQ or mildly spiced dishes."
                     ],
                     learnMore: [
                         "Merlot is user-friendly, often used in Bordeaux blends for softness.",
                         "Sangiovese is Italy’s most planted grape, perfect for tomato-rich dishes due to bright acidity.",
                         "Zinfandel’s jammy character is linked to high sugar accumulation in warm climates."
                     ],
             temperatureRange: .range15to20,
             weatherCondition: nil,
             servingTemperature: "14-16°C (57-61°F)",
             recommendedGlassware: "Bordeaux-style red wine glass for Merlot/Zin; universal red glass is fine too.",
             agingPotential: "Generally 2–5 years; premium examples can age longer (esp. certain Sangiovese).",
             quickFacts: [
                         "Merlot’s plush texture comes from moderate tannins and fruit-forward esters.",
                         "Sangiovese’s crisp acidity accentuates tomato-based sauces and grilled veggies.",
                         "Zinfandel can reach high ABV, yielding jammy, bold fruit flavors.",
                         "Cooler-region Merlot can show more structure, while warm-region Merlot is fruitier."
                     ]),
        
        // 20 - 25
        Wine(name: ["Crisp Rosés & Chillable Reds (Rosé / Lambrusco / Light Cinsault)"],
             type: .rose,
             description: [
                         "Short & Sweet: Refreshing, lighter wines perfect for mild-to-warm weather.",
                         "Dry Rosé: Strawberry, raspberry, citrus notes, typically dry or off-dry.",
                         "Lambrusco: Light fizz, fruity, can be secco (dry) or amabile (slightly sweet).",
                         "Light Cinsault: Soft, perfumed red that’s great lightly chilled."
                     ],
                     pairingNotes: [
                         "Salads, light pasta, grilled fish, or vegetable skewers.",
                         "Lambrusco pairs well with charcuterie, pizza, or cured meats.",
                         "Perfect picnic wines (sandwiches, hummus wraps, light tapas)."
                     ],
                     learnMore: [
                         "Rosé styles vary by region—Provence rosé is pale and crisp, Spanish rosados can be deeper.",
                         "Lambrusco from Emilia-Romagna can be dry or sweet; secco pairs best with savory dishes.",
                         "Chillable reds like Cinsault are trending as refreshing summer reds."
                     ],
             temperatureRange: .range20to25,
             weatherCondition: nil,
             servingTemperature: "10-12°C (50-54°F) for rosé; slightly cooler if you prefer.",
             recommendedGlassware: "Universal white/rosé glass; or a smaller red glass if lightly chilling a red.",
             agingPotential: "Best enjoyed young (within 1–2 years).",
             quickFacts: [
                         "Rosé’s pink hue comes from limited skin contact; fruity notes come from esters.",
                         "Lambrusco’s gentle bubbles result from charmat or ancestral methods.",
                         "Cinsault’s light body and delicate aromatics make it ideal for chilling.",
                         "Most rosés are labeled dry, but read labels for ‘off-dry’ or sweet styles."
                     ]),
        
        // 25 - 30
        Wine(name: ["Sauvignon Blanc","Albariño","Dry Riesling"],
             type: .white,
             description: [
                         "Short & Sweet: Crisp whites with high acidity to beat the heat.",
                         "Sauvignon Blanc: Zesty citrus, herbal/grass notes, sometimes tropical fruit.",
                         "Albariño (Spain): Peach, apricot, subtle salinity and refreshing acidity.",
                         "Dry Riesling: Lime, green apple, mineral or floral notes, typically very crisp."
                     ],
                     pairingNotes: [
                         "Seafood (shrimp, mussels), tangy goat cheese, or veggie stir-fries.",
                         "Cuts through oily or fried foods nicely.",
                         "Great with light Asian dishes (sushi, spring rolls) or summer salads."
                     ],
                     learnMore: [
                         "New Zealand Sauv Blanc has notable passion fruit/guava thiols, plus grassy methoxypyrazines.",
                         "Albariño thrives in coastal Galicia—hints of a ‘sea breeze’ salinity are common.",
                         "Dry Riesling is versatile; dryness can vary from bone-dry to slightly off-dry."
                     ],
             temperatureRange: .range25to30,
             weatherCondition: nil,
             servingTemperature: "8-10°C (46-50°F) for crisp whites; can go cooler on a hot day.",
             recommendedGlassware: "White wine glass with a narrower bowl to concentrate aromas.",
             agingPotential: "Best young (1–3 years), though some Rieslings can age longer.",
             quickFacts: [
                         "Sauvignon Blanc’s bright aromas come from thiols (tropical) and pyrazines (herbal).",
                         "Albariño’s saline hint reflects coastal terroir and mineral soils.",
                         "Riesling’s signature acidity preserves freshness and can balance slight residual sugar.",
                         "Check the label for dryness level, especially with Riesling."
                     ]),
        
        // 30 - 35
        Wine(name: ["Vermentino","Pinot Grigio","Grüner Veltliner"],
             type: .white,
             description: [
                         "Short & Sweet: Thirst-quenching whites, ideal for hot weather.",
                         "Vermentino: Citrus, white flowers, sometimes a pleasant bitter note.",
                         "Pinot Grigio: Light, crisp, pears and green apples.",
                         "Grüner Veltliner: Lime, green pepper, white pepper spice—can be very refreshing."
                     ],
                     pairingNotes: [
                         "Grilled chicken/fish, antipasti, crisp veggie dishes (zucchini, peppers).",
                         "Salads or light seafood pasta. Great for pool parties or picnics.",
                         "Veg-friendly plates: grilled squash, peppers, or Mediterranean mezze."
                     ],
                     learnMore: [
                         "Vermentino is common in Sardinia/Tuscany, often showing saline notes.",
                         "Pinot Grigio from Italy is usually light, while Alsace Pinot Gris can be richer.",
                         "Grüner Veltliner ranges from simple, citrusy quaffers to complex, age-worthy bottles."
                     ],
             temperatureRange: .range25to30,
             weatherCondition: nil,
             servingTemperature: "8-10°C for crisp whites, potentially 10–12°C for richer versions.",
             recommendedGlassware: "Universal white wine glass; narrower bowl for extra aromatic focus.",
             agingPotential: "Typically 1–3 years; some Grüner can age longer if high quality.",
             quickFacts: [
                         "Vermentino’s mild bitterness can come from phenolics in the grape skins.",
                         "Pinot Grigio’s fresh profile is maintained by cool fermentation and minimal oak.",
                         "Grüner’s peppery note (rotundone or minor pyrazines) sets it apart.",
                         "Look for ‘Alto Adige’ Pinot Grigio or single-vineyard Grüner for added complexity."
                     ]),
        
        // >35
        Wine(name: ["Prosecco","Cava","Moscato d'Asti"],
             type: .sparkling,
             description: [
                         "Short & Sweet: Bubbly, ultra-refreshing wines for scorching weather.",
                         "Prosecco: Light, frothy, with green apple and pear notes.",
                         "Cava: Crisp, citrusy, fine bubbles, hint of toastiness from traditional method.",
                         "Moscato d’Asti: Slightly sweet, low alcohol, bursting with peach and floral aromas."
                     ],
                     pairingNotes: [
                         "Chilled appetizers (prosciutto, melon, olives), fresh fruit, or salty snacks.",
                         "Perfect for Spritz cocktails (Aperol, Campari) or Bellinis.",
                         "Moscato pairs well with fruit tarts, pastries, or spicy Asian dishes (cools the heat!)."
                     ],
                     learnMore: [
                         "Prosecco uses the Charmat method (tank fermentation) with the Glera grape.",
                         "Cava uses traditional bottle fermentation (like Champagne), creating toasty/bready notes.",
                         "Moscato d’Asti is frizzante (gently sparkling) and often ~5–6% ABV."
                     ],
             temperatureRange: .above35,
             weatherCondition: nil,
             servingTemperature: "6-8°C (42-46°F). Keep it well-chilled in hot weather.",
             recommendedGlassware: "Universal white/sparkling glass. Flutes preserve bubbles but limit aroma.",
             agingPotential: "Best consumed within 1–2 years (or even sooner).",
             quickFacts: [
                         "Prosecco’s fresh flavors come from cooler fermentation preserving fruity esters.",
                         "Cava’s brioche notes result from yeast autolysis during bottle aging.",
                         "Moscato d’Asti’s peachy aromas come from the Muscat grape’s natural terpenes.",
                         "Dry or Brut versions of Prosecco/Cava are less sweet; check labels for sweetness level."
                     ]),
        
        // Rainy Weather
        Wine(name: ["Pinot Noir","Gamay","Light Merlot"],
             type: .red,
             description: [
                         "Short & Sweet: Cozy, medium-bodied reds suited to drizzly days.",
                         "Pinot Noir: Earthy, cherry notes, soft tannins, elegant acidity.",
                         "Gamay: Light, fruity, easy to sip (often lightly chilled).",
                         "Light Merlot: Round, moderate tannins, comforting warmth."
                     ],
                     pairingNotes: [
                         "Mushroom risotto or creamy pasta. Veggie stroganoff or roasted root veggies.",
                         "Roasted poultry like chicken or turkey.",
                         "Charcuterie and cheese boards—great for a cozy indoor setting."
                     ],
                     learnMore: [
                         "Pinot Noir can develop savory mushroom/forest floor notes with age.",
                         "Gamay is commonly associated with Beaujolais, noted for carbonic maceration.",
                         "Cool-climate Merlot (e.g., from Bordeaux) can be more complex than warm-climate versions."
                     ],
             temperatureRange: .range10to15,
             weatherCondition: .rain,
             servingTemperature: "12-14°C (53-57°F)",
             recommendedGlassware: "Burgundy-style glass for Pinot, universal red glass for Gamay or Merlot.",
             agingPotential: "2–5 years typically; high-end Pinot can age 10+ years.",
             quickFacts: [
                         "Pinot Noir’s earthy complexity is partly due to subtle phenolics and terroir.",
                         "Gamay’s light body and bright fruit are perfect for a rainy pick-me-up.",
                         "Merlot’s roundness and moderate tannins give comfort on a damp day.",
                         "Lightly chill Gamay (around 12°C) to enhance fruity, fresh qualities."
                     ]),
        
        // High Humidity
        Wine(name: ["Champagne (Brut)","Cava","Extra-Dry Sparkling Rosé"],
             type: .sparkling,
             description: [
                         "Short & Sweet: Crisp, bubbly wines that refresh in muggy weather.",
                         "Brut Champagne: Fine bubbles, green apple, lemon, brioche.",
                         "Cava: Zesty citrus, floral hints, often more affordable than Champagne.",
                         "Extra-Dry Sparkling Rosé: Fruity, floral, bright, and refreshing."
                     ],
                     pairingNotes: [
                         "Light canapés (smoked salmon, goat cheese), fresh fruit desserts (berries).",
                         "The fizz and acidity cut through humidity and rich foods alike.",
                         "Great for celebrations or casual sipping in steamy climates."
                     ],
                     learnMore: [
                         "Brut Champagne is quite dry (0–12 g/L sugar), focusing on acidity and yeast notes.",
                         "Cava is made with native Spanish grapes (Macabeo, Parellada, Xarel·lo).",
                         "Sparkling Rosé can be made by blending red and white base wines or brief skin contact."
                     ],
             temperatureRange: .range25to30,
             weatherCondition: .highHumidity,
             servingTemperature: "6-8°C (42-46°F). Keep it on ice in humid conditions.",
             recommendedGlassware: "White/sparkling wine glass. A flute is traditional but less aromatic.",
             agingPotential: "Best within 1–2 years; vintage Champagnes can age longer.",
             quickFacts: [
                         "Traditional method sparkling wines (Champagne/Cava) undergo second fermentation in-bottle.",
                         "Yeast autolysis over time gives brioche or biscuit notes.",
                         "Extra-Dry Rosé usually has a touch more sweetness than Brut, but still crisp.",
                         "Serve well-chilled to balance sweetness and preserve bubbles in sticky weather."
                     ]),
        
        // Low Humidity
        Wine(name: ["Chenin Blanc","Soave","Dry Furmint"],
             type: .white,
             description: [
                         "Short & Sweet: Wines with good fruit depth and vibrant acidity in hot, dry conditions.",
                         "Chenin Blanc (Loire, South Africa): Can be dry/off-dry, with pear, quince, honey notes.",
                         "Soave (Italy): Made from Garganega, shows citrus, almond, subtle florals.",
                         "Dry Furmint (Hungary): Zippy acidity, green apple, lemon, sometimes a hint of smoke or minerality."
                     ],
                     pairingNotes: [
                         "Grilled chicken skewers, summer salads, mildly spiced Asian dishes.",
                         "Soft to semi-firm cheeses (young Gouda, Havarti), falafel, roasted eggplant.",
                         "Bright acidity and moderate alcohol make these very food-friendly."
                     ],
                     learnMore: [
                         "Chenin Blanc is famously versatile—sparkling, sweet, or dry styles exist.",
                         "Soave Classico offers more complexity from hillside vineyards; expect light nuttiness.",
                         "Furmint is known for Tokaj’s sweet wines but dry styles are increasingly popular."
                     ],
             temperatureRange: .range30to35,
             weatherCondition: .lowHumidity,
             servingTemperature: "8-10°C (46-50°F) or slightly cooler in extreme heat.",
                    recommendedGlassware: "White wine glass; a smaller bowl if you want to focus aromatics.",
                    agingPotential: "1–3 years typically; certain Chenin Blancs can age longer.",
             quickFacts: [
                         "Chenin Blanc’s high acidity balances honeyed notes in off-dry versions.",
                         "Soave’s almond hint comes from Garganega’s inherent flavors and possible lees contact.",
                         "Dry Furmint’s acidity refreshes the palate in arid conditions.",
                         "Loire Chenin can age for decades, developing complex aromas (wax, lanolin, nuts)."
                     ]),
        
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
