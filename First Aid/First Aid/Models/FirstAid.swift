import Foundation

class FirstAid{
    static var lijstOngevallen = DataClass.getData()
    static var lijstSymptomen = [Symptoom.buitenBewustzijn, Symptoom.pijn, Symptoom.bleek, Symptoom.misselijk, Symptoom.zwakkeHartslag, Symptoom.snelleHartslag, Symptoom.beschadigdeHuid, Symptoom.lidmaatStaatVerkeerd, Symptoom.verlamd, Symptoom.schokken, Symptoom.vlekken, Symptoom.trageReactie, Symptoom.kramp, Symptoom.geenSteun]
    static var ongevallen: [Ongeval: Int] = [:]
    static var ongeval: Ongeval?
    
    static func vulOngevallen(){
        if !ongevallen.isEmpty{
            return
        }
        for ongeval in DataClass.getData(){
            ongevallen[ongeval] = 0
        }
    }
    
    static func voegSymptomenToe(_ symptomen: [Symptoom]){
        if ongevallen.isEmpty{
            vulOngevallen()
        }
        for (ongeval, _) in ongevallen{
            ongevallen[ongeval] = ongeval.index(symptomen: symptomen)
        }
    }
    
    static func geefOngevallen() -> [Ongeval]{
        if ongevallen.isEmpty{
            vulOngevallen()
        }
        var myArray = Array(ongevallen.keys)
        myArray.sort{
            let o1 = ongevallen[$0]!
            let o2 = ongevallen[$1]!
            
            if o1>o2 {
                return true
            } else if o1<o2 {
                return false
            }
            
            return $0 < $1
            
        }
        return myArray
    }
    
    static func resetOngevallen(){
        for key in ongevallen.keys{
            ongevallen[key] = 0
        }
    }
    
    static func setOngeval(index: Int){
        ongeval = geefOngevallen()[index]
    }
    
}
