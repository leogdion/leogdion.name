import Foundation
import ArgumentParser

extension URL: ExpressibleByArgument {
  public init?(argument: String) {
    self.init(string: argument)
  }
}
