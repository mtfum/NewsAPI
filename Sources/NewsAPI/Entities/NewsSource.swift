import Foundation

public struct NewsSource: Decodable, Identifiable {
  public let id: String?
  public let name: String
  public let description: String?
  public let url: URL?
  public let category: NewsSourceCategory?
  public let language: Language?
  public let country: Country?
}

extension NewsSource: Equatable {
  public static func == (lhs: NewsSource, rhs: NewsSource) -> Bool {
    lhs.id == rhs.id
    && lhs.name == rhs.name
    && lhs.description == rhs.description
    && lhs.url == rhs.url
    && lhs.category == rhs.category
    && lhs.language == rhs.language
    && lhs.country == rhs.country
  }
}

#if DEBUG
extension NewsSource {
  public static let demo = NewsSource(
    id: "abc-news",
    name: "ABC News",
    description: "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
    url: URL(string: "https://abcnews.go.com"),
    category: .general,
    language: .en,
    country: .us
  )
}
#endif
