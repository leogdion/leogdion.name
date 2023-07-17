import Foundation
import Publish
import ArgumentParser

public extension LeoGDionNameSiteCommand {
  struct ImportCommand: ParsableCommand {
    public static let markdownGenerator = PandocMarkdownGenerator()
    
    public init() { }

    public static var configuration = CommandConfiguration(
      commandName: "import",
      abstract: "Command for import into the leogdion.name site.",
      subcommands: [WordPress.self]
    )
  }
}
