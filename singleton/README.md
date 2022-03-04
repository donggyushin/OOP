# Singleton

pure-singleton and semi-singleton design pattern in Swift

### Prerequisites

- 중급자 수준정도의 프로그래밍 기초 지식
- class, object, constructor, inheritance, value, reference type 등등에 대한 개념 숙지

### Singleton class

객체지향 프로그래밍의 세계에서 singleton class란 어플리케이션의 라이프사이클을 통틀어 단 하나의 객체만으로 사용되어질 클래스를 말합니다. <br /><br />

iOS 앱 개발에서도 singleton 디자인 패턴은 사용됩니다. UIApplication 클래스가 그 대표적인 예시중 하나인데요, UIApplication 클래스 객체는 앱이 런칭되어질때 딱 한 번만 생성되어지고 AppDelegate에 인자로 전달됩니다. 
`application(_:didFinishLaunchingWithOptions:)`
<br />
<br />

Singleton 디자인 패턴에는 크게 두 가지 종류가 존재합니다. 
- Pure-singleton
- Semi-singleton
<br />
<br />

### Pure-Singleton Design Pattern
- Pure-Singleton 디자인 패턴이 적용된 클래스는 개발자가 명시적으로 클래스의 객체를 스스로 생성할 수 없습니다. 개발자는 미리 선언된 클래스의 객체에 접근하여 함수와 속성들에 접근만 가능합니다. 
- Pure-singleton 클래스의 객체는 앱이 런칭되어질때 자동으로 한 번만 생성됩니다. 
- Pure-singleton 클래스들은 inheritance confusion을 방지하기 위해서 final 키워드로 마크되어져야 합니다. Swift 에서는 같은 목적으로 class 대신 struct도 사용가능합니다. 
- 개발자는 pure-singleton 클래스를 상속할 수 없습니다. 어떤 클래스를 상속하려고 할때에는 해당 super 클래스의 생성자를 호출해야하는데, pure-singleton class 같은 경우는 생성자를 private으로 선언하기 때문에 접근이 불가능합니다. 
<br />

Pure-singleton 디자인패턴에 대해서 코드로 접근해봅시다. 
<br />
https://github.com/donggyushin/OOP/blob/b6669f66a7a3e315a5cf4cf42b43ee0cf0ca4581/singleton/pureSingleton.swift#L1-L24

<br />
위의 예제 코드에서 우리는 LogManager 클래스의 모든 생성자 메서드를 private으로 선언했기 때문에, 해당 클래스의 외부에서는 해당 클래스의 인스턴스를 생성할 수가 없게 됩니다. 만일 외부에서 해당 클래스의 객체를 생성하려고 할 시에 컴파일러가 error 를 던져줄겁니다. 
<br />

UIApplication, AppDelegate 이 대표적인 pure-singleton class의 예시입니다. 혹시 UIApplication 클래스 객체를 생성해보려고 했다면 앱이 크래쉬나는것을 경험해보셨을 겁니다. <br /><br />

### Pure singleton 디자인 패턴의 한계
우리는 pure-singleton 클래스를 테스트 데이터를 이용해서 테스해볼 수 없습니다. 위의 예제에서 LogManager 에게 실제 프로덕션 레벨의 url 이 아닌 어떤 테스트 모드의 url 을 던져줘서 테스트 해보려고 한다고 생각해보세요. 방법이 없습니다. <br />

우리는 이 한계점을 pure-singleton 디자인 패턴 대신에 semi-singleton 디자인 패턴을 사용하거나 의존성 주입 패턴을 사용함으로써 극복할 수 있습니다. 추후에 의존성 주입에 대한 포스팅도 진행하도록 하겠습니다만 우선 지금은 semi-singleton 디자인 패턴에 대해서 알아봅시다. <br /><br />

### Semi-singleton design pattern
Semi-singleton 디자인 패턴은 개발자가 필요하다면 스스로 인스턴스를 생성할 수 있습니다. 그리고 개발자가 final 키워드로 semi-singleton 클래스를 선언하지 않는다면 상속도 얼마든지 가능합니다. semi-design 패턴에서 final 키워드는 필요조건은 아닙니다. <br /><br />

https://github.com/donggyushin/OOP/blob/0fa34f71dba17f863f5cc725e938eebc825648c4/singleton/semiSingleton.swift#L1-L37

위의 코드에서는 클래스의 생성자를 private 으로 선언하지 않았습니다. 그래서 우리는 해당 클래스의 객체를 언제든지 새롭게 생성해서 databaseURLEndpoint에 대한 의존성을 없앨 수 있습니다. 그래서 테스트 코드도 쉽게 작성할 수 있게 되죠. <br /><br />

UserDefault, FileManager, NotificationCenter 가 대표적인 semi-singleton 클래스의 예시입니다. 개발자들은 미리 정의된 shared 인스턴스를 UserDefault.standard, FileManager.default, NotificationCenter.default 등을 통해 사용가능하고, 원한다면 객체를 새로 생성해서 이용해도 됩니다. 

pure 혹은 semi singleton 클래스의 미리 정의된 객체들은 앱이 종료될때까지 메모리에 올라가서 사라지지 않을 겁니다. 개발자가 명시적으로 생성한 semi singleton 클래스의 객체는 본인의 수명이 다하면 언제든지 메모리에서 개발자가 내릴 수 있기 때문에 코드를 최적화할 수 있다는 장점이 있습니다. 

> Question: 그럼 어떤 디자인 패턴이 더 좋나요? 언제 pure를 쓰고 언제 semi를 사용해야 하나요?


이 질문에 대한 대답은 class의 역할에 따라 결졍됩니다. 만약에 어떤 포인트에서 속성이나 메서드들이 추가/변경 되거나, mock 데이터를 이용해서 테스트 케이스를 붙여야할 케이스가 필요하다면 semi-singleton 디자인 패턴을 사용해야겠죠. 
<br /><br />
만약에 클래스에 대한 유닛테스트를 마치고 이것을 프레임워크나 라이브러리로 출시하고 싶다면 pure-singleton 디자인 패턴을 사용해도 좋습니다. 왜냐하면 당신이 짠 클래스의 테스트코드같은 경우에는 해당 코드가 배포되어지기 전인 당신의 몫이지, 해당 코드를 물려받아서 사용하는 개발자의 몫은 아니기 때문이죠. 


