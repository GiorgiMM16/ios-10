import Cocoa

/* weak - ის გამოყენება */

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    weak var hasMotorcycle: Motorcycle?
    
    deinit {
        print("ადამიანის ფუნქცია დე-ინიცირდა")
    }
}

class Motorcycle {
    var type: String
    
    init(type: String) {
        self.type = type
    }
    
    weak var hasOwner: Person?
    
    deinit {
        print("მოტოციკლის ფუნქცია დე-ინიცირდა")
    }
}

var vaxula: Person?
var motomoto: Motorcycle?

vaxula = Person(name: "vaxuxu")
motomoto = Motorcycle(type: "swrafi")


vaxula!.hasMotorcycle = motomoto
motomoto!.hasOwner = vaxula

vaxula = nil
motomoto = nil

/* unowned - ის გამოყენება */

class Owner {
    var name1: String
    var hasCreditCard: CreditCard?
    init(name1: String) {
        self.name1 = name1
    }
    
    deinit {
        print("ოუნერის დე-ინიციალიზაცია მოხდა")
    }
}

class CreditCard {
    var type1: String
    unowned var hasOwner: Owner
    init(type1: String, hasOwner: Owner) {
        self.type1 = type1
        self.hasOwner = hasOwner
    }
    deinit {
        print("კრედიტ ქარდის დე-ინიციალიზაცია მოხდა")
    }
}

var gigi: Owner?
var americanExpressGoldPlatinumCardWithExtraBenefits: CreditCard?




gigi = Owner(name1: "gigi")
americanExpressGoldPlatinumCardWithExtraBenefits = CreditCard(type1: "gold", hasOwner: gigi!)


gigi!.hasCreditCard = CreditCard(type1: "golden", hasOwner: gigi!)

gigi = nil
americanExpressGoldPlatinumCardWithExtraBenefits = nil

/* დაიჭირეთ self ქლოჟერებში */

class namdviliAdamiani {
    var name: String
    lazy var gamarjobaSheni: () -> Void = { /* lazy-ს გარდა სხვა ვერანაირად დავაქეფჩერე ქლოჟერში*/
        print("gamarjoba megobaro, me var \(self.name)")
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("დეინიცილიზირდა, მოიგე!!")
    }
}

var adamianuka: namdviliAdamiani?
adamianuka = namdviliAdamiani(name: "suxoeli maxo")

adamianuka?.gamarjobaSheni()
adamianuka = nil

/* ესეც შენი პროტოკოლუკები*/

protocol gamarjobaGagimarjos {
    var name: String {get}
    func misalmeba()
}

class magariAdamiani: gamarjobaGagimarjos {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func misalmeba() {
        print("gamarjoba megobaro")
    }
    
    deinit {
        print("ვუჰუ დეინიციალიზაცია")
    }
}

var uproMagariAdamiani: magariAdamiani? = magariAdamiani(name: "beka-giorgi")
uproMagariAdamiani?.misalmeba()

// Using the protocol type
var greetable: gamarjobaGagimarjos = magariAdamiani(name: "vaso")
greetable.misalmeba()

uproMagariAdamiani = nil


/* enum -ის გამოყენებაზე რაც მოვიძიე და მოვიფიქრე, idle ით კეთდებაო და მგონი ეგ არ გიგულისხმია დავალებაში როცა ეგ მოგვეცი*/

/* გატესტვა ყველას ბოლოშია, დაპრინტვით ვიგებდი დეინიციალიზაცია ან/და ინიციალიზაცია მოხდა თუ არა*/

/* struct - ს რაც შეეხება, ეგ ხომ კოპირდება და გადაეცემა სხვებს როცა ჭირდებათ, და ARC რაშუაშია მათთან მგონი, როგორც მივგუგლე მათ მემორის მომატება დაკლებაში ARC-ს არაფერი ესაქმებაო */














