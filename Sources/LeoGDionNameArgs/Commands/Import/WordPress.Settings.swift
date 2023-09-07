import Foundation
import LeoGDionNameSite
import ContributeWordPress

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension LeoGDionNameSiteCommand.ImportCommand.WordPress {
  // ex: Content
  var rootPublishPathURL: URL {
    URL(
      fileURLWithPath: publishSiteDirectory,
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
  
  var assetImportSetting: AssetImportSetting {
    switch (importAssetsDirectory, skipDownload) {
    case (.some(let directory), _):
      return .copyFilesFrom(.init(fileURLWithPath: directory, relativeTo: FileManager.default.currentDirectoryURL))
    case (.none, true):
      return .none
    default:
      return .download
    }
  }
}
