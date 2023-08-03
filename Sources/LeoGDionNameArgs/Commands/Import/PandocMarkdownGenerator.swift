import Foundation
import Contribute
import ShellOut
import Contribute

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
extension PandocMarkdownGenerator {
  public static func defaultShellOut(to command: String, arguments: [String]) throws -> String {
    try ShellOut.shellOut(to: command, arguments: arguments)
  }
  
  public init (temporaryFile: @escaping (String) throws -> URL = Temporary.file(fromContent:)) {
    self.init(shellOut: Self.defaultShellOut(to:arguments:), temporaryFile: temporaryFile)
  }
}
