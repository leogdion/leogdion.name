import Foundation
import ArgumentParser

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct LeoGDionNameSiteCommand: ParsableCommand {
  public init() {}

  public static var configuration = CommandConfiguration(
    abstract: "Command for maintaining the Leo George Dion site.",
    subcommands: [PublishCommand.self, ImportCommand.self],
    defaultSubcommand: PublishCommand.self
  )
}
