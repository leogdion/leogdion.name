import Foundation
import ContributeWordPress

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public extension LeoGDionNameSiteCommand.ImportCommand.WordPress {
  // ex: ./Content
  var contentPathURL: URL {
    URL(fileURLWithPath: exportMarkdownDirectory, relativeTo: FileManager.default.currentDirectoryURL)
  }

  // ex: ./Resources
  var resourcesPathURL: URL {
    URL(fileURLWithPath: exportResourcesDirectory, relativeTo: FileManager.default.currentDirectoryURL)
  }

  // ex: ./Import/WordPress
  var directoryURL: URL {
    URL(fileURLWithPath: wordpressExportsDirectory, relativeTo: FileManager.default.currentDirectoryURL)
  }

  // ex: ./Resources/media/wp-images
  var resourceImagePathURL: URL {
    resourcesPathURL.appendingPathComponent(imageRelativePath)
  }
}
