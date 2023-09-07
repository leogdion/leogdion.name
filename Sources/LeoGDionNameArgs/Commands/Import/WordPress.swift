import Foundation
import ArgumentParser
import Contribute
import ContributeWordPress

public extension LeoGDionNameSiteCommand.ImportCommand {
  struct WordPress: ParsableCommand {
    public static var configuration = CommandConfiguration(
      commandName: "wordpress",
      abstract: "Command for import WordPress export file into the LeoGDion site."
    )

    @Argument(help: "Directory which contains a single or multiple imports.", completion: CompletionKind.directory)
    public var wordpressExportsDirectory: String

    @Option(help: "Directory which contains images, pdf files, and other assets.", completion: CompletionKind.directory)
    public var importAssetsDirectory: String?
    
    @Option
    public var publishSiteDirectory : String = ""
    
    @Option(help: "Path to Save Images Relative to Resources.")
    public var assetRelativePath = "media/wp-assets"

    @Flag(help: "Overwrite Downloaded Assets.")
    public var overwriteAssets: Bool = false

    @Flag(help: "Skip Downloading Assets.")
    public var skipDownload: Bool = false
    
    @Option(help: "Root address for your Wordpress Site (ex. https://leogdion.name/).")
    public var rootSiteURL: URL?
    
    public init() { }


    public func run() throws {
      let assetImportSetting = self.importAssetPathURL.map(AssetImportSetting.copyFilesFrom) ?? .download
      try MarkdownProcessor.beginImport(
        from: self.exportsDirectoryURL,
        to: self.rootPublishPathURL,
        redirectsFormattedUsing: NetlifyRedirectFormatter(),
        importAssetsBy: assetImportSetting,
        overwriteAssets: overwriteAssets,
        usingGenerator: PandocMarkdownGenerator()
      )
    }
  }
}
