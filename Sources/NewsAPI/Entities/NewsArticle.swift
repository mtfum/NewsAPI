import Foundation

public struct NewsArticle: Decodable {
  public let source: NewsSource
  public let author: String?
  public let title: String?
  public let description: String?
  public let url: URL?
  public let urlToImage: URL?
//  public let publishedAt: Date?
  public let content: String?
}

extension NewsArticle: Identifiable {
  public var id: String { title ?? "" }
}

extension NewsArticle: Equatable {
  public static func == (lhs: NewsArticle, rhs: NewsArticle) -> Bool {
    lhs.title == rhs.title
    && lhs.author == rhs.author
    && lhs.description == rhs.description
    && lhs.url == rhs.url
    && lhs.urlToImage == rhs.urlToImage
//    && lhs.publishedAt == rhs.publishedAt
    && lhs.content == rhs.content
  }
}

#if DEBUG
extension NewsArticle {
  public static let demo = NewsArticle(
    source: .init(
      id: "the-verge",
      name: "The Verge",
      description: nil, url: nil, category: nil, language: nil, country: nil
    ),
    author: "Richard Lawler",
    title: "Kaseya ransomware attackers demand $70 million, claim they infected over a million devices",
    description: "Three days after ransomware attackers hijacked a managed services platform, recovery efforts continued. The REvil group is reportedly asking for as much as $70 million in Bitcoin to unlock the more than 1 million devices infected.",
    url: URL(string: "https://www.theverge.com/2021/7/5/22564054/ransomware-revil-kaseya-coop"),
    urlToImage: URL(string: "https://cdn.vox-cdn.com/thumbor/nk-drxT0WYuHTTAQw6MhPgi4LK8=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/8792137/acastro_170629_1777_0008_v2.jpg"),
//    publishedAt: { () -> Date in
//      let formatter = DateFormatter()
//      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//      return formatter.date(from: "2021-07-05T19:45:10Z")!
//    }(),
    content: "Filed under:\r\nThe supply chain attack has reached over a thousand organizations.\r\nIllustration by Alex Castro / The Verge\r\nThree days after ransomware attackers started the holiday weekend by comprom… [+3376 chars]"
  )
}
#endif
