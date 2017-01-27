import Foundation

class FirstAid{
    static var lijstOngevallen: [Ongeval] = []
    static var lijstSymptomen = [Symptoom.buitenBewustzijn, Symptoom.pijn, Symptoom.bleek, Symptoom.misselijk, Symptoom.zwakkeHartslag, Symptoom.snelleHartslag, Symptoom.beschadigdeHuid, Symptoom.lidmaatStaatVerkeerd, Symptoom.verlamd, Symptoom.schokken, Symptoom.vlekken, Symptoom.trageReactie, Symptoom.kramp, Symptoom.geenSteun]
    static var ongevallen: [Ongeval: Int] = [:]
    static var ongeval: Ongeval?
    
    static func vulOngevallen(){
        if !ongevallen.isEmpty{
            return
        }
        if lijstOngevallen.isEmpty{
            let jsonFile = Bundle.main.path(forResource: "ongevallen", ofType:"json")
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
            if let jsonDictionary = parseJSONFromData(jsonData){
                let ongevalDictionaries = jsonDictionary["ongevallen"] as! [[String : Any]]
                for ongevalDictionary in ongevalDictionaries {
                    let naam = ongevalDictionary["naam"] as? String
                    let symptomen = ongevalDictionary["symptomen"] as? [String]
                    let behandeling = ongevalDictionary["behandeling"] as? [String]
                    
                    let o = Ongeval(naam: naam!)
                    o.voegSymptomenToe(parseSymptomenFromStringArray(symptomen!))
                    o.voegBehandelingToe(behandeling!)
                    
                    lijstOngevallen.append(o)
                }
            }

        }
        
        for ongeval in lijstOngevallen {
            ongevallen[ongeval] = 0
        }
        
    }
    
    static func parseJSONFromData(_ jsonData: Data?) -> [String: AnyObject]?{
        if let data = jsonData {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject]
                return jsonDictionary
            }catch let error as NSError {
                print("error processing json data: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    static func parseSymptomenFromStringArray(_ array: [String]) -> [Symptoom]{
        var symptomen: [Symptoom] = []
        for symptoom in array{
            symptomen.append(parseSymptoomFromString(symptoom))
        }
        return symptomen
    }
    
    static func parseSymptoomFromString(_ string: String) -> Symptoom{
        return Symptoom.init(description: string)!
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
