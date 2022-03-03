class Person {
    //personal details
    var name: String = ""
    var gender: String = ""
    var birthDate: String = ""
    var birthPlace: String = ""
    var height: String = ""
    var weight: String = ""
    
    //contact details
    var phone: String = ""
    var email: String = ""
    
    //address details
    var streeAddress: String = ""
    var zipCode: String = ""
    var city: String = ""
    
    //work details
    var companyName: String = ""
    var designation: String = ""
    var annualIncome: String = ""
    
    //empty constructor
    init() { }
}

class PersonBuilder {
    var person: Person
    init(person: Person) {
        self.person = person
    }
    
    //personal details builder switching
    var personalInfo: PersonPersonalDetailsBuilder {
        return PersonPersonalDetailsBuilder(person: self.person)
    }
    
    //contact details builder switching
    var contacts: PersonContactDetailsBuilder {
        return PersonContactDetailsBuilder(person: self.person)
    }
    
    //address details builder switching
    var lives: PersonAddressDetailsBuilder {
        return PersonAddressDetailsBuilder(person: self.person)
    }
    
    //work details builder switching
    var works: PersonCompanyDetailsBuilder {
        return PersonCompanyDetailsBuilder(person: self.person)
    }
    
    func build() -> Person {
        return self.person
    }
}

//PersonPersonalDetailsBuilder: update personal details
class PersonPersonalDetailsBuilder: PersonBuilder {
    func nameIs(_ name: String) -> Self {
        self.person.name = name
        return self
    }
    
    func genderIs(_ gender: String) -> Self {
        self.person.gender = gender
        return self
    }
    
    func bornOn(_ birthDate: String) -> Self {
        self.person.birthDate = birthDate
        return self
    }
    func bornAt(_ birthPlace: String) -> Self {
        self.person.birthPlace = birthPlace
        return self
    }
    func havingHeight(_ height: String) -> Self {
        self.person.height = height
        return self
    }
    func havingWeight(_ weight: String) -> Self {
        self.person.weight = weight
        return self
    }
}

//PersonContactDetailsBuilder: update contact details
class PersonContactDetailsBuilder: PersonBuilder {
    func hasPhone(_ phone: String) -> Self {
        self.person.phone = phone
        return self
    }
    func hasEmail(_ email: String) -> Self {
        self.person.email = email
        return self
    }
}

//PersonAddressDetailsBuilder: update address details
class PersonAddressDetailsBuilder: PersonBuilder {
    func at(_ streeAddress: String) -> Self {
        self.person.streeAddress = streeAddress
        return self
    }
    func withZipCode(_ zipCode: String) -> Self {
        self.person.zipCode = zipCode
        return self
    }
    func inCity(_ city: String) -> Self {
        self.person.city = city
        return self
    }
}

//PersonCompanyDetailsBuilder: update company details
class PersonCompanyDetailsBuilder: PersonBuilder {
    func inCompany(_ companyName: String) -> Self {
        self.person.companyName = companyName
        return self
    }
    func asA(_ designation: String) -> Self {
        self.person.designation = designation
        return self
    }
    func hasAnnualEarning(_ annualIncome: String) -> Self {
        self.person.annualIncome = annualIncome
        return self
    }
}

func main() {
    var donggyu = Person()
    let personBuilder = PersonBuilder(person: donggyu)
    
    donggyu = personBuilder
        .personalInfo
        .nameIs("신동규")
        .genderIs("Male")
        .bornOn("13nd Oct 1994")
        .bornAt("Jeon-Ju, South Korea")
        .havingWeight("62 kg")
        .contacts
        .hasPhone("+8210 9041-1019")
        .hasEmail("donggyu9410@gmail.com")
        .lives
        .at("노원구 동일로190길 65")
        .inCity("Seoul")
        .withZipCode("01842")
        .build()
    
    print("\(donggyu.name) has contact number \(donggyu.phone) and email \(donggyu.email)")
    
    // later on when we have company details ready for the person
    
    donggyu = personBuilder
        .works
        .asA("Software engineer")
        .inCompany("Happymoonday")
        .build()
    
    print("\(donggyu.name) works in \(donggyu.companyName) company as a \(donggyu.designation)")
}

main()
