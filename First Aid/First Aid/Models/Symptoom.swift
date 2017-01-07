enum Symptoom: String{
    case buitenBewustzijn = "Is hij/zij buiten bewustzijn?"
    case pijn = "Heeft hij/zij veel pijn?"
    case bleek = "Ziet hij/zij er bleek uit?"
    case misselijk = "Voelt hij/zij zich misselijk of draaierig?"
    case zwakkeHartslag = "Heeft hij/zij een bleke hartslag?"
    case snelleHartslag = "Heeft hij/zij een snelle hartslag?"
    case beschadigdeHuid = "Heeft hij/zij een beschadigde huid?"
    case lidmaatStaatVerkeerd = "Staat er een lidmaat verkeerd?"
    case verlamd = "Is hij/zij verlamd?"
    case schokken = "Heeft hij/zij schokken?"
    case vlekken = "Ziet hij/zij zwarte vlekken voor de ogen?"
    case trageReactie = "Heeft hij/zij een trage reactievermogen?"
    case kramp = "Worden de vingers of tenen van het slachtoffer verkrampt?"
    case geenSteun = "Kan het slachtoffer moeilijk bewegen of steun behouden?"
}

extension Symptoom: CustomStringConvertible{
    var description: String{
        switch self{
        case .buitenBewustzijn: return "Buiten bewustzijn"
        case .pijn: return "Pijn"
        case .bleek: return "Bleek"
        case .misselijk: return "Misselijk"
        case .zwakkeHartslag: return "Zwakke hartslag"
        case .snelleHartslag: return "Snelle hartslag"
        case .beschadigdeHuid: return "Beschadigde huid"
        case .lidmaatStaatVerkeerd: return "Lidmaat staat verkeerd"
        case .verlamd: return "Verlamd"
        case .schokken: return "Schokken"
        case .vlekken: return "Zwarte vlekken voor de ogen"
        case .trageReactie: return "Trage reactie"
        case .kramp: return "Kramp"
        case .geenSteun: return "Geen steun"
        }
    }
}
