import Foundation
import Contribute
import ShellOut

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
//
//public protocol MarkdownGenerator {
//  func markdown(fromHTML htmlString: String) throws -> String
//}
//
//
//public struct PandocMarkdownGenerator: MarkdownGenerator {
//  public init(
//    shellOut: @escaping (String, [String]) throws -> String = defaultShellOut,
//    temporaryFile: @escaping (String) throws -> URL = Temporary.file(fromContent:)
//  ) {
//    self.shellOut = shellOut
//    self.temporaryFile = temporaryFile
//  }
//
//  public static func defaultShellOut(to command: String, arguments: [String]) throws -> String {
//    try ShellOut.shellOut(to: command, arguments: arguments)
//  }
//
//  let shellOut: (String, [String]) throws -> String
//  let temporaryFile: (String) throws -> URL
//  let pandocPath = ProcessInfo.processInfo.environment["PANDOC_PATH"] ?? "$(which pandoc)"
//
//  public enum Temporary {
//    static let temporaryDirURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
//
//    public static func file(fromContent content: String) throws -> URL {
//      let temporaryFileURL = temporaryDirURL.appendingPathComponent(UUID().uuidString)
//      try content.write(to: temporaryFileURL, atomically: true, encoding: .utf8)
//      return temporaryFileURL
//    }
//  }
//
//  public func markdown(fromHTML htmlString: String) throws -> String {
//    let temporaryFileURL = try temporaryFile(htmlString)
//    return try shellOut(pandocPath, ["-f html -t markdown_strict", temporaryFileURL.path])
//  }
//}
