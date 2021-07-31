import Foundation

public final class NewsAPI {

  private let apiKey: String
  private let session: URLSession

  private lazy var decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
  }()

  public init(apiKey: String, session: URLSession = URLSession.shared) {
    self.apiKey = apiKey
    self.session = session
  }

  public func getTopHeadlines(
    sources: [String] = [],
    query: String? = nil,
    category: NewsSourceCategory? = nil,
    language: Language = Language.en
  ) async throws -> [NewsArticle] {
    guard let url = Endpoint.topHeadlines(key: apiKey, query: query, sources: sources, category: category, language: language).url else {
      throw ErrorResponse.invalidURL
    }
    do {
      let (data, _) = try await session.data(from: url, delegate: nil)
      let response = try decoder.decode(APIReponse<ArticlesResponse>.self, from: data)
      switch response.result {
      case .success(let articles):
        return articles
      case .failure(let error):
        throw error
      }
    } catch {
      throw error
    }
  }

  public func search(
    query: String,
    sources: [String] = [],
    sortBy: SortBy? = nil,
    language: Language? = nil
  ) async throws -> [NewsArticle] {
    guard let url = Endpoint.search(key: apiKey, query: query, sources: sources, sortBy: sortBy, language: language).url else {
      throw ErrorResponse.invalidURL
    }
    do {
      let (data, _) = try await session.data(from: url, delegate: nil)
      let response = try decoder.decode(APIReponse<ArticlesResponse>.self, from: data)
      switch response.result {
      case .success(let articles):
        return articles
      case .failure(let error):
        throw error
      }
    } catch {
      throw error
    }
  }

  public func getSources(
    category: NewsSourceCategory? = nil,
    language: Language? = nil,
    country: Country? = nil
  ) async throws -> [NewsSource] {
    guard let url = Endpoint.sources(key: apiKey, category: category, language: language, country: country).url else {
      throw ErrorResponse.invalidURL
    }
    do {
      let (data, _) = try await session.data(from: url, delegate: nil)
      let response = try decoder.decode(APIReponse<SourcesResponse>.self, from: data)
      switch response.result {
      case .success(let sources):
        return sources
      case .failure(let error):
        throw error
      }
    } catch {
      throw error
    }
  }
}
