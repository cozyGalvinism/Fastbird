import Alamofire
import Foundation

public class Fastbird {
    var baseUrl: String
    var apiUrl: String
    var apiKey: String
    let decoder: JSONDecoder

    public init(baseUrl: String, apiKey: String) {
        self.baseUrl = baseUrl
        if baseUrl.hasSuffix("/") {
            self.apiUrl = baseUrl + "api"
        } else {
            self.apiUrl = baseUrl + "/api"
        }
        self.apiKey = apiKey
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    public func isReady() -> Bool {
        return self.baseUrl.count > 0 && self.apiKey.count > 0
    }

    public func setBaseUrl(baseUrl: String) {
        self.baseUrl = baseUrl
        if baseUrl.hasSuffix("/") {
            self.apiUrl = baseUrl + "api"
        } else {
            self.apiUrl = baseUrl + "/api"
        }
    }

    public func setAPIKey(apiKey: String) {
        self.apiKey = apiKey
    }

    public func getServers(completion: @escaping (Result<APIResponseList<APIResponseObject<PteroClientServer, APIResponsePaginationMetaData>, APIResponsePaginationMetaData>, AFError>) -> Void) {
        let url = apiUrl + "/client";
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Accept": "application/json"
        ]
        AF.request(url, method: .get, headers: headers).responseDecodable(of: APIResponseList<APIResponseObject<PteroClientServer, APIResponsePaginationMetaData>, APIResponsePaginationMetaData>.self, decoder: self.decoder) { response in
            completion(response.result)
        }
    }

    public func getServer(serverId: String, completion: @escaping (Result<APIResponseObject<PteroClientServer, APIResponseServerMetaData>, AFError>) -> Void) {
        let url = apiUrl + "/client/servers/\(serverId)";
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Accept": "application/json"
        ]
        AF.request(url, method: .get, headers: headers).responseDecodable(of: APIResponseObject<PteroClientServer, APIResponseServerMetaData>.self, decoder: self.decoder) { response in
            completion(response.result)
        }
    }

    public func getServerResourceUsage(serverId: String, completion: @escaping (Result<APIResponseObject<PteroClientServerResourceUsage, APIResponseServerMetaData>, AFError>) -> Void) {
        let url = apiUrl + "/client/servers/\(serverId)/resources";
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Accept": "application/json"
        ]
        AF.request(url, method: .get, headers: headers).responseDecodable(of: APIResponseObject<PteroClientServerResourceUsage, APIResponseServerMetaData>.self, decoder: self.decoder) { response in
            completion(response.result)
        }
    }

    public func getServersAsync() async throws -> APIResponseList<APIResponseObject<PteroClientServer, APIResponsePaginationMetaData>, APIResponsePaginationMetaData> {
        let url = apiUrl + "/client";
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Accept": "application/json"
        ]
        let task = AF.request(url, method: .get, headers: headers).serializingDecodable(APIResponseList<APIResponseObject<PteroClientServer, APIResponsePaginationMetaData>, APIResponsePaginationMetaData>.self, decoder: self.decoder)
        let response = try await task.value
        return response
    }

    public func getServerAsync(serverId: String) async throws -> APIResponseObject<PteroClientServer, APIResponseServerMetaData> {
        let url = apiUrl + "/client/servers/\(serverId)";
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Accept": "application/json"
        ]
        let task = AF.request(url, method: .get, headers: headers).serializingDecodable(APIResponseObject<PteroClientServer, APIResponseServerMetaData>.self, decoder: self.decoder)
        let response = try await task.value
        return response
    }

    public func getServerResourceUsageAsync(serverId: String) async throws -> APIResponseObject<PteroClientServerResourceUsage, APIResponseServerMetaData> {
        let url = apiUrl + "/client/servers/\(serverId)/resources";
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(apiKey)",
            "Accept": "application/json"
        ]
        let task = AF.request(url, method: .get, headers: headers).serializingDecodable(APIResponseObject<PteroClientServerResourceUsage, APIResponseServerMetaData>.self, decoder: self.decoder)
        let response = try await task.value
        return response
    }
}
