import XCTest
import DotEnv
@testable import Fastbird

final class FastbirdTests: XCTestCase {
    func test_getServers() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let env = DotEnv(withFile: ".env")

        let expectation = self.expectation(description: "getServers")
        var success = false

        let baseUrl = env.get("FASTBIRD_BASE_URL") ?? "http://localhost:8080"
        let apiKey = env.get("FASTBIRD_API_KEY") ?? "1234567890"

        let client = Fastbird(baseUrl: baseUrl, apiKey: apiKey)
        client.getServers(completion: { result in
            switch result {
            case .success(let response):
                print(response)
                success = true
            case .failure(let error):
                print(error)
                success = false
            }
            expectation.fulfill()
        })

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssert(success)
    }

    func test_getServer() throws {
        let env = DotEnv(withFile: ".env")

        let expectation = self.expectation(description: "getServer")
        var success = false

        let baseUrl = env.get("FASTBIRD_BASE_URL") ?? "http://localhost:8080"
        let apiKey = env.get("FASTBIRD_API_KEY") ?? "1234567890"
        let serverId = env.get("FASTBIRD_SERVER_ID") ?? "1"

        let client = Fastbird(baseUrl: baseUrl, apiKey: apiKey)
        client.getServer(serverId: serverId) { result in
            switch result {
            case .success(let response):
                print(response)
                success = true
            case .failure(let error):
                print(error)
                success = false
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssert(success)
    }

    func test_getServerResourceUsage() throws {
        let env = DotEnv(withFile: ".env")

        let expectation = self.expectation(description: "getServerResourceUsage")
        var success = false

        let baseUrl = env.get("FASTBIRD_BASE_URL") ?? "http://localhost:8080"
        let apiKey = env.get("FASTBIRD_API_KEY") ?? "1234567890"
        let serverId = env.get("FASTBIRD_SERVER_ID") ?? "1"

        let client = Fastbird(baseUrl: baseUrl, apiKey: apiKey)
        client.getServerResourceUsage(serverId: serverId) { result in
            switch result {
            case .success(let response):
                print(response)
                success = true
            case .failure(let error):
                print(error)
                success = false
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssert(success)
    }
}
