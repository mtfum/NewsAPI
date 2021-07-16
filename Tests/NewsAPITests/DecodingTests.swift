//
//  DecodingTests.swift
//  
//
//  Created by Fumiya Yamanaka on 2021/07/15.
//

import XCTest
import NewsAPI

final class DecodingTests: XCTestCase {

  func testDecodingArticleResponse() throws {
    let expected: NewsArticle = .demo
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let response = try XCTUnwrap(decoder.decode(NewsArticle.self, from: articleResponseJson.data(using: .utf8)!))
    XCTAssertEqual(response, expected)
  }

  func testDecodingNewsSource() throws {
    let expected: NewsSource = .demo
    let decoder = JSONDecoder()
    let response = try XCTUnwrap(decoder.decode(NewsSource.self, from: newsSourceJson.data(using: .utf8)!))
    XCTAssertEqual(response, expected)
  }

  func testDecodingErrorAPIResponse() throws {
    let response = try XCTUnwrap(JSONDecoder().decode(ErrorResponse.self, from: errorResponseJson.data(using: .utf8)!))
    let expectedMessage = "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."
    XCTAssertEqual(response.code, .apiKeyMissing)
    XCTAssertEqual(response.message, expectedMessage)
  }
}

private let articleResponseJson = """
{
  "source": {
    "id": "the-verge",
    "name": "The Verge"
  },
  "author": "Richard Lawler",
  "title": "Kaseya ransomware attackers demand $70 million, claim they infected over a million devices",
  "description": "Three days after ransomware attackers hijacked a managed services platform, recovery efforts continued. The REvil group is reportedly asking for as much as $70 million in Bitcoin to unlock the more than 1 million devices infected.",
  "url": "https://www.theverge.com/2021/7/5/22564054/ransomware-revil-kaseya-coop",
  "urlToImage": "https://cdn.vox-cdn.com/thumbor/nk-drxT0WYuHTTAQw6MhPgi4LK8=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/8792137/acastro_170629_1777_0008_v2.jpg",
  "publishedAt": "2021-07-05T19:45:10Z",
  "content": "Filed under:\\r\\nThe supply chain attack has reached over a thousand organizations.\\r\\nIllustration by Alex Castro / The Verge\\r\\nThree days after ransomware attackers started the holiday weekend by comprom… [+3376 chars]"
}
"""

private let newsSourceJson = """
{
  "id": "abc-news",
  "name": "ABC News",
  "description": "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
  "url": "https://abcnews.go.com",
  "category": "general",
  "language": "en",
  "country": "us"
}
"""

private let errorResponseJson = """
{
  "code": "apiKeyMissing",
  "message": "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."
}
"""
