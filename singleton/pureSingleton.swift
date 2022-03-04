
final class LogManager {
  //shared and only one available object
  static let logger: LogManager = LogManager(databaseURLEndpoint: "https://www.donggyu.com/logger/live")
  
  private var databaseURLEndpoint: String
  
  //marked as private, no one is allowed to access this initialiser outside of the class
  private init(databaseURLEndpoint: String) {
    self.databaseURLEndpoint = databaseURLEndpoint
  }
  
  func log(_ value: String...){
    //complex code to connect to the databaseURLEndpoint and send the value to server directly
  }
}

//This is function in playground which executes our test code
func main(){
  LogManager.logger.log("test log from medium blog") //this will log on "/live" endpoint
}

//call main to execute our test code
main()
