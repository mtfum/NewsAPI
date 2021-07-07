import Foundation
private let baseURL = "https://newsapi.org/v2/"

public actor NewsAPI {

  private let apiKey: String
  private let session: URLSession

  public init(apiKey: String, session: URLSession = URLSession.shared) {
    self.apiKey = apiKey
    self.session = session
  }

  public func fetchHeadline() async throws -> [NewsArticle] {
    let (data, _) = try await session.data(
      from: URL(string: baseURL + "top-headlines?country=us&apiKey=\(apiKey)")!,
      delegate: nil
    )

    let news = try? JSONDecoder().decode(NewsHeadline.self, from: data)
    return news?.articles ?? []
  }

  public func searchNews(query: String) async throws -> [NewsArticle] {
    let (data, _) = try await session.data(
      from: URL(string: baseURL + "everything?q=\(query)&apiKey=\(apiKey)")!,
      delegate: nil
    )

    let news = try? JSONDecoder().decode(NewsHeadline.self, from: data)
    return news?.articles ?? []
  }

  public func fetchSources() async throws -> [NewsSource] {
    do {
      let (data, _) = try await session.data(
        from: URL(string: baseURL + "sources?apiKey=\(apiKey)")!,
        delegate: nil
      )

      let source = try? JSONDecoder().decode(NewsSourceResponse.self, from: data)
      return source?.sources ?? []
    } catch {
      return []
    }

  }
}
