# OOP
Design patterns by tutorials<br /><br />
<img src="https://miro.medium.com/max/700/1*YzzWikIJMuc3Bzz3r08aEg.png" width=500 />

### Prerequisites
- 중급자 수준정도의 프로그래밍 기초 지식
- class, object, constructor, inheritance, value, reference type 등등에 대한 개념 숙지

### design pattern 이란 
많은 소프트웨어 개발자들 사이에서 좋은 예시라고 채택되어지는 프로그래밍 기법들을 말한다.  <br /><br />

builder design pattern은 객체를 조금더 간단하고, 읽기 쉬운 방식으로 생성할 수 있게끔 도와준다. builder design pattern은 다음의 간단한 룰들을 따른다. 
- 원래 클래스 표현과 구성 방법을 구분한다. 
- 마지막 단계에서 클래스의 객체를 반환한다. 

<br /><br />

> builder design pattern 의 대표적인 좋은 예시중 하나는 SwiftUI 이다. 

<br /><br />

### Problem
10개가 넘는 속성들을 가지고 있는 Person 이라는 class가 있다고 생각해보자. 해당 클래스의 객체를 생성할때에 10개 이상의 인자들을 전달해주어야 하고, 속성들을 관리하는 함수를 관리하는 것도 까다로워질 것이다. 결국에는 가독성이 떨어지는 코드만이 남을 뿐이다. <br /><br />

```
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
```
