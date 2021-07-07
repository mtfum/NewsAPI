import Foundation

public struct NewsSourceResponse: Decodable {
  public enum Status: String, Decodable {
    case ok, error
  }
  public let status: Status
  public let sources: [NewsSource]
}

public struct NewsSource: Decodable, Identifiable {
  public let id: String
  public let name: String
  public let description: String
  public let url: URL
  public let category: NewsSourceCategory
  public let country: String // TODO
}

#if DEBUG
extension NewsSource {
  public static let demo = NewsSource(
    id: "abc-news",
    name: "ABC News",
    description: "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
    url: URL(string: "https://abcnews.go.com")!,
    category: .business,
    country: "us"
  )
}
#endif
