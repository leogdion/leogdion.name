import ArgumentParser
import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct LeoGDionNameSiteCommand: ParsableCommand {
  public init() {}

  public static var configuration = CommandConfiguration(
    abstract: "Command for maintaining the Leo George Dion site.",
    subcommands: [PublishCommand.self],
    defaultSubcommand: PublishCommand.self
  )
}

// TODO: Move this to separate file
extension URL: ExpressibleByArgument {
  public init?(argument: String) {
    self.init(string: argument)
  }
}
