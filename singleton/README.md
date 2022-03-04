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
