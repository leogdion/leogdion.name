import Foundation
import Publish
import Plot

public struct LeoGDionNameSite: Website {
  public init() { }

  public enum SectionID: String, WebsiteSectionID {
    case blog
  }

  public struct ItemMetadata: WebsiteItemMetadata {
    
  }

  public enum SiteInfo {
    public static let url = URL(staticString: "https://leogdion.name")
    public static let name = "Leo G Dion"
    public static let title = "Leo G Dion"
    // TODO: @Leo, We need site description
    public static let description = "description"
    public static let imagePath: Path = "/android-chrome-512x512.png"
  }

  public let url = SiteInfo.url
  public var name: String = SiteInfo.name
  public var description: String = SiteInfo.description
  public var language: Language { .english }
  public var imagePath: Path? = SiteInfo.imagePath
}

public extension LeoGDionNameSite {
  func publish(includeDrafts: Bool) throws {
    try publish(withTheme: .foundation)
  }
}
