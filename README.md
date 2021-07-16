# NewsAPI

An API framework for [newsapi.org](https://newsapi.org/) with Swift.


## Requirement

- Swift5.5+

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/mtfum/NewsAPI.git", from: "0.1.0")
```

## Usage

### Setup

```Swift 

import NewsAPI

let client = NewsAPI(apiKey: "YOUR_API_KEY")

```

### Get Sources

```Swift
let articles = try await client.getSources()
```

### Search

```Swift
let articles = try await client.search(query: "bitcoin")
```

### Top-Headlines

```Swift
let articles = try await client.getTopHeadlines()
```
