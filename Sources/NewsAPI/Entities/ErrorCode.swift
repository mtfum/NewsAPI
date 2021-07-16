public enum ErrorCode: String, Decodable, Error {
  case apiKeyDisabled,
  apiKeyExhausted,
  apiKeyInvalid,
  apiKeyMissing,
  parameterInvalid,
  parametersMissing,
  rateLimited,
  sourcesTooMany,
  sourceDoesNotExist,
  unexpectedError,

  invalidURL,
  decodingError
}
