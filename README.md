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

https://github.com/donggyushin/OOP/blob/4bc7668ba476a3cac0ae7c7a68f2ee4e4e19d8d4/builder/WithoutDesignPattern.swift#L1-L83

<br />

위의 코드를 playground에 붙이고 실행시켜보면 로직적으로는 문제가 전혀 없기 때문에 해당 코드는 잘 돌아갈 것이다. <br />

우리는 위의 코드를 다음 몇 가지 사항들을 고려하여 개선시켜볼 수 있다. 

1. 값들을 전달할때에 특정 순서에 맞추어서 전달해주어야 한다. 코드의 가독성을 증가시키기 위해서 인자들의 순서를 편한대로 재조합시키는게 불가능하다. 
2. 모든 값들을 한 번에 전달해주어야 한다. 때때로 우리는 몇몇 속성값들을 모를 수 있다. 

<br />
Eg. Person class의 인자를 생성해야 하는데, 해당 사람이 아직 job 을 구하는 중이어서 현재는 job이 없지만 추후에 언제든지 job 속성을 추가해줄 수 있는 상황

### Solution
1. 관련된 속성들의 논리적인 그룹을 생성한다. 
2. 각각의 그룹화된 속성들에 대한 builder class를 생성한다. 
3. 마지막 단계에서 원하는 객체를 반환한다. 

<br /><br />

예시를 통해서 간단하게 살펴보자. 우리는 이미 Person이라는 class를 가지고 있다. 해당 클래스를 4개의 논리적인 그룹으로 분리해보자. 

1. 개인신상
2. 연락망
3. 주소
4. 회사

<br />

디자인 패턴을 함께 사용하면 위에서 언급하였던 두 문제점들을 해결할 수 있습니다.

https://github.com/donggyushin/OOP/blob/4bc7668ba476a3cac0ae7c7a68f2ee4e4e19d8d4/builder/Example1.swift#L1-L166
