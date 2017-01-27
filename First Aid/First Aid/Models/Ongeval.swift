class Ongeval{
    var naam: String
    var symptomen: [Symptoom] = []
    var behandeling: [String] = []
    
    init(naam: String){
        self.naam = naam
    }
    
    func voegSymptomenToe(_ symptomen: [Symptoom]){
        self.symptomen.append(contentsOf: symptomen)
    }
    
    func voegBehandelingToe(_ behandeling: [String]){
        self.behandeling.append(contentsOf: behandeling)
    }
    
    func index(symptomen: [Symptoom]) -> Int{
        var index = 0
        for symptoom in symptomen{
            index += self.symptomen.filter{$0 == symptoom}.count
        }
        return index
    }
}

extension Ongeval : Hashable{
    var hashValue: Int{
        return naam.hashValue
    }
    
    static func ==(lhs: Ongeval, rhs: Ongeval) -> Bool{
        return lhs.naam == rhs.naam
    }
}

extension Ongeval: Comparable{
    static func <(lhs: Ongeval, rhs:Ongeval) -> Bool{
        return lhs.naam < rhs.naam
    }
}
