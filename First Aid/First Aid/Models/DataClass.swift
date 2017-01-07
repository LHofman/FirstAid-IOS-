class DataClass{
    static func getData() -> [Ongeval]{
        let hartinfact = Ongeval(naam: "hartinfact")
        let flauwte = Ongeval(naam: "flauwte")
        let beroerte = Ongeval(naam: "beroerte")
        let epilepsie = Ongeval(naam: "epilepsie aanval")
        let hyperventilatie = Ongeval(naam: "hyperventilatie")
        let letsel = Ongeval(naam: "letsel")
        
        hartinfact.voegSymptomenToe(Symptoom.pijn, Symptoom.zwakkeHartslag, Symptoom.snelleHartslag, Symptoom.misselijk, Symptoom.bleek)
        hartinfact.voegBehandelingToe("Bel onmiddelijk de 112", "Geem hem/haar genoeg ruimte om te kunnen rusten, maak spannende kledij los", "Breng hem/haar indien nodig naar een plek met meer zuurstof en leg het slachtoffer in een comfortabele houding", "Vraag hem/haar om eventuele eigen medicatie")
        
        flauwte.voegSymptomenToe(Symptoom.bleek, Symptoom.misselijk, Symptoom.vlekken)
        flauwte.voegBehandelingToe("Leg hem/haar plat op de grond, zodat de bloedtoevoer naar de hersenen loopt", "controleer de val, leg hem/haar in stabiele zijliging", "zorg voor genoeg frisse lucht (haal eventueel een vochtig doekje", "maak knellende kledij los", "als het langer dan 2 minuten duurt, bel dan de hulpdiensten")
        
        beroerte.voegSymptomenToe(Symptoom.verlamd, Symptoom.buitenBewustzijn, Symptoom.misselijk)
        beroerte.voegBehandelingToe("Gebruik de FAST-test:", "1, kijk of het gezicht schuin hangt", "2, vraag het slachtoffer om de ogen te sluiten en beide armen in de lucht te steken", "3, controleer of de spraak van het slachtoffer normaal is", "4, probeer de tijd van de beroerte te achterhalen", "Bel zo rap mogelijk de 112!", "Geef het slachtoffer ondersteuning en zorg voor een comfortabele houding", "blijf het bewustzijn en de ademhaling controleren")
        
        epilepsie.voegSymptomenToe(Symptoom.buitenBewustzijn, Symptoom.schokken, Symptoom.trageReactie)
        epilepsie.voegBehandelingToe("Probeer om blessures van het slachtoffer en iedereen in de buurt te voorkomen tijdens de schokken door hem genoeg ruimte te geven", "noteer de duur en de reacties van de schokken", "bel de 112 bij een aanval die langer dan 1 minuut duurt", "bel de 112 bij buwesteloosheid na een aanval")
        
        hyperventilatie.voegSymptomenToe(Symptoom.snelleHartslag, Symptoom.misselijk, Symptoom.kramp)
        hyperventilatie.voegBehandelingToe("Breng het slachtoffer naar een rustige plek om te kalmeren", "Blijf steeds bij het slachtoffer", "Laat hem/haar in een zak blazen om de ademhaling te kalmeren", "als het blijft aanhouden bel dan de hulpdiensten")
        
        letsel.voegSymptomenToe(Symptoom.pijn, Symptoom.lidmaatStaatVerkeerd, Symptoom.geenSteun)
        letsel.voegBehandelingToe("Leg ijs op de wonde", "hou het lidmaat onbeweeglijk", "Zet het ledemaat indien in abnormale staat nooit zelf terug, maar bel de hulpdiensten", "stelp de bloeding", "bij spierpijn: neem een warm bad/douche", "bij spierkramp: rek/maseer het weefsel", "bij spierverrekking: raadpleeg een arts")
        
        return [hartinfact, flauwte, beroerte, epilepsie, hyperventilatie, letsel]
    }
}
