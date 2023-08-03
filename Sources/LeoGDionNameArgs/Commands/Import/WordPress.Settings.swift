import Foundation
import LeoGDionNameSite
import ContributeWordPress

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension LeoGDionNameSiteCommand.ImportCommand.WordPress {
  // ex: Content
  var contentPathURL: URL {
    URL(
      fileURLWithPath: exportMarkdownDirectory,
      relativeTo: FileManager.default.currentDirectoryURL
    )
  }

  // ex: Resources
  var resourcesPathURL: URL {
    URL(
      fileURLWithPath: exportResourcesDirectory,
      relativeTo: FileManager.default.currentDirectoryURL
    )
  }

  // ex: Import/WordPress
  var exportsDirectoryURL: URL {
    URL(
      fileURLWithPath: wordpressExportsDirectory,
      relativeTo: FileManager.default.currentDirectoryURL
    )
  }

  // ex: Resources/media/wp-assets
  var resourceAssetPathURL: URL {
    resourcesPathURL.appendingPathComponent(assetRelativePath)
  }

  // ex: WordPress/html/
  var importAssetPathURL: URL? {
    guard let importAssetsDirectory = importAssetsDirectory else {
      return nil
    }

    return URL(
      fileURLWithPath: importAssetsDirectory,
      relativeTo: FileManager.default.currentDirectoryURL
    )
  }

  // ex: https://leogdion.name
  var assetsSiteURL: URL {
    rootSiteURL ?? LeoGDionNameSite.SiteInfo.url
  }
  
}
