import Foundation

public struct NewsArticle: Decodable {
  public let source: NewsSource
  public let author: String?
  public let title: String?
  public let description: String?
  public let url: URL?
  public let urlToImage: URL?
}

extension NewsArticle: Identifiable {
  public var id: String { title ?? "" }
}

#if DEBUG
extension NewsArticle {
  public static let demo = NewsArticle(
    source: .demo,
    author: "author_name",
    title: "title",
    description: "description",
    url: URL(string: "https://www.google.com/"),
    urlToImage: URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.appcoda.com%2Fasyncimage%2F&psig=AOvVaw2PgUQMXK-u1uTI0KMAzYNc&ust=1624813991363000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCIDBuPjltfECFQAAAAAdAAAAABAD"))
}
#endif
