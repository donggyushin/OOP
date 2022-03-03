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
  
  //constructor
  init(name: String,
       gender: String,
       birthDate: String,
       birthPlace: String,
       height: String,
       weight: String,
       phone: String,
       email: String,
       streeAddress: String,
       zipCode: String,
       city: String,
       companyName: String,
       designation: String,
       annualIncome: String) {
    self.name = name
    self.gender = gender
    self.birthDate = birthDate
    self.birthPlace = birthPlace
    self.height = height
    self.weight = weight
    self.phone = phone
    self.email = email
    self.streeAddress = streeAddress
    self.zipCode = zipCode
    self.height = height
    self.city = city
    self.companyName = companyName
    self.designation = designation
    self.annualIncome = annualIncome
  }
}

//This is function in Xcode-Playground which executes our test code
func main() {
  let hitendra = Person(name: "Hitendra Solanki",
                        gender: "Male",
                        birthDate: "2nd Oct 1991",
                        birthPlace: "Gujarat, India",
                        height: "5.9 ft",
                        weight: "85kg",
                        phone: "+91 90333-71772",
                        email: "hitendra.developer@gmail.com",
                        streeAddress: "52nd Godrej Street",
                        zipCode: "380015",
                        city: "Ahmedabad",
                        companyName: "Fortune 500",
                        designation: "Software architect",
                        annualIncome: "45,000 USD")
  
  //use of Person object
  print("\(hitendra.name) works in \(hitendra.companyName) compay as a \(hitendra.designation).")
}

//call main to execute our test code in Xcode-Playground
main()

/* Console output:
Hitendra Solanki works in Fortune 500 compay as a Software architect.
*/
