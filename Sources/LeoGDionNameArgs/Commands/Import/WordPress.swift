import Foundation
import ArgumentParser
import ContributeWordPress

public extension LeoGDionNameSiteCommand.ImportCommand {
  struct WordPress: ParsableCommand, WordPressMarkdownProcessorSettings {

    public static var configuration = CommandConfiguration(
      commandName: "wordpress",
      abstract: "Command for import WordPress export file into the LeoGDion site."
    )

    @Argument(help: "Directory which contains a single or multiple imports.", completion: CompletionKind.directory)
    public var wordpressExportsDirectory: String

    @Option(help: "Directory which contains images, pdf files, and other assets.", completion: CompletionKind.directory)
    public var importAssetsDirectory: String?

    @Option(help: "Base directory for image downloads, redirect files, and other resources.", completion: CompletionKind.directory)
    public var exportResourcesDirectory: String

    @Option(help: "Destination directory for markdown files.")
    public var exportMarkdownDirectory: String

    @Option(help: "Path to Save Images Relative to Resources.")
    public var assetRelativePath = "media/wp-assets"

    @Flag(help: "Overwrite Downloaded Assets.")
    public var overwriteAssets: Bool = false

    @Flag(help: "Skip Downloading Assets.")
    public var skipDownload: Bool = false
    
    @Option(help: "Root address for your Wordpress Site (ex. https://leogdion.name/).")
    public var rootSiteURL: URL?
    
    public init() { }

    public static func markdownFrom(html: String) throws -> String {
      try LeoGDionNameSiteCommand.ImportCommand.markdownGenerator.markdown(fromHTML: html)
    }

    public func run() throws {
      var processor = try WordPressMarkdownProcessor(postFilters: [
        RegexKeyPostFilter(pattern: "post", keyPath: \.type),
        RegexKeyPostFilter(pattern: "publish", keyPath: \.status)
      ])
      try processor.begin(withSettings: self)
    }
  }
}
