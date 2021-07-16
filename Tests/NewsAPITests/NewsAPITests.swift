import XCTest
@testable import NewsAPI

private let API_KEY = "f32c792c14fc4e90a859cde979d06673"

final class NewsAPITests: XCTestCase {

  let client = NewsAPI(apiKey: API_KEY)

  func testGetTopHeadlines() async throws {
    do {
      let articles = try await client.getTopHeadlines()
      assert(!articles.isEmpty)
    } catch {
      assertionFailure(String(describing: error))
    }
  }

  func testGetSources() async throws {
    do {
      let articles = try await client.getSources()
      assert(!articles.isEmpty)
    } catch {
      if let e = (error as? ErrorResponse) {
        print(e.code.rawValue, e.message)
      }
      assertionFailure(String(describing: error))

    }
  }

  func testSearch() async throws {
    do {
      let articles = try await client.search(query: "bitcoin")
      assert(!articles.isEmpty)
    } catch {
      assertionFailure(String(describing: error))
    }
  }

}
