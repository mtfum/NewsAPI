//
//  NewsAPITests.swift
//
//
//  Created by Fumiya Yamanaka on 2021/07/15.
//

import XCTest
@testable import NewsAPI

private let API_KEY = "f32c792c14fc4e90a859cde979d06673"

final class NewsAPITests: XCTestCase {

  let client = NewsAPI(apiKey: API_KEY)

  func testGetTopHeadlines() async throws {
    do {
      let articles = try await client.getTopHeadlines()
      XCTAssertTrue(!articles.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetTopHeadlinesWithSources() async throws {
    do {
      let articles = try await client.getTopHeadlines(sources: ["abc-news", "bbc-news"])
      XCTAssertTrue(!articles.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testGetSources() async throws {
    do {
      let sources = try await client.getSources()
      XCTAssertTrue(!sources.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testSearch() async throws {
    do {
      let articles = try await client.search(query: "bitcoin")
      XCTAssertTrue(!articles.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }

  func testSearchWithSourcesAndSortBy() async throws {
    do {
      let articles = try await client.search(query: "olympics", sources: ["bbc-news"], sortBy: .popularity)
      XCTAssertTrue(!articles.isEmpty)
    } catch {
      XCTFail(String(describing: error))
    }
  }
}
