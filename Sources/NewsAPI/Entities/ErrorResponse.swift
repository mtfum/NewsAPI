public struct ErrorResponse: Decodable, Error {
  public let code: ErrorCode
  public let message: String
}

extension ErrorResponse {
  static let invalidURL: ErrorResponse = .init(
    code: .invalidURL,
    message: "couldn't create url, please check again"
  )
}
