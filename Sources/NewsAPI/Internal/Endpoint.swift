import Foundation

struct Endpoint {
  let path: String
  let queryItems: [URLQueryItem]
}

extension Endpoint {
  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "newsapi.org"
    components.path = "/v2/\(path)"
    components.queryItems = queryItems

    return components.url
  }
}

extension Endpoint {
  static func search(
    key: String,
    query: String,
    sources: [NewsSource] = [],
    category: NewsSourceCategory? = nil,
    language: Language? = nil,
    country: Country? = nil
  ) -> Self {
    return .init(
      path: "everything",
      queryItems: [
        URLQueryItem(name: "apiKey", value: key),
        URLQueryItem(name: "q", value: query),
        URLQueryItem(name: "category", value: category?.rawValue),
        URLQueryItem(name: "sources", value: sources.map(\.name).joined(separator: ",")),
        URLQueryItem(name: "language", value: language?.rawValue),
        URLQueryItem(name: "country", value: country?.rawValue)
      ])
  }

  static func topHeadlines(
    key: String,
    query: String? = nil,
    sources: [NewsSource] = [],
    category: NewsSourceCategory? = nil,
    country: Country? = nil,
    language: Language? = nil
  ) -> Self {
    return .init(
      path: "top-headlines",
      queryItems: [
        URLQueryItem(name: "apiKey", value: key),
        URLQueryItem(name: "q", value: query),
        URLQueryItem(name: "category", value: category?.rawValue),
        URLQueryItem(name: "country", value: country?.rawValue),
        URLQueryItem(name: "language", value: language?.rawValue)
      ])
  }

  static func sources(
    key: String,
    category: NewsSourceCategory? = nil,
    language: Language? = nil,
    country: Country? = nil
  ) -> Self {
    return .init(
      path: "sources",
      queryItems: [
        URLQueryItem(name: "apiKey", value: key),
        URLQueryItem(name: "category", value: category?.rawValue),
        URLQueryItem(name: "language", value: language?.rawValue),
        URLQueryItem(name: "country", value: country?.rawValue)
      ])
  }
}
