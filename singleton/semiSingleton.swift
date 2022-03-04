//In semi-singleton design pattern, marking the class as final is optional
final class LogManager {
  //shared object
  static let logger: LogManager = LogManager(databaseURLEndpoint: "https://www.donggyu.com/logger/live")
  
  private var databaseURLEndpoint: String
  
  //not marked as private, anyone is allowed to access this initialiser outside of the class
  init(databaseURLEndpoint: String) {
    self.databaseURLEndpoint = databaseURLEndpoint
  }
  
  func log(_ value: String...){
    //complex code to connect to the databaseURLEndpoint and send the value to server directly
  }
}

//This is function executes our main code
func main(){
  LogManager.logger.log("main log from medium blog on live server endpoint") //this will log on "/live" endpoint
}


// This is function executes our TEST MODE code
// Here in playground, Hitendra Solanki created this method for the demostratino purpose only
// Usually we write this kind of test codes, inside the test targe of the XCode-project
func testThatLogManger(){
  
  //we are allowed to create an instace of class LogManager,
  //because it follows the Semi-Singleton design patterns
  let logManagerTestObject = LogManager(databaseURLEndpoint: "https://www.donggyu.com/logger/test")
  
  logManagerTestObject.log("test log from medium blog on test server endpoint") //this will log on "/test" endpoint
}

main() //call main
testThatLogManger() //call test execution