import ArgumentParser
import LeoGDionNameSite
import Publish

public extension LeoGDionNameSiteCommand {
  struct PublishCommand: ParsableCommand {
    enum Mode: String, ExpressibleByArgument {
      case drafts, production
    }

    public static var configuration = CommandConfiguration(commandName: "publish")
    public init() {}

    @Option var mode: Mode

    public func run() throws {
      try LeoGDionNameSite().publish(includeDrafts: mode == .drafts)
    }
  }
}
