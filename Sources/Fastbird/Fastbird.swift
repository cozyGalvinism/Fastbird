import Alamofire
import Foundation

public struct Fastbird {
    let baseUrl: String
    let apiUrl: String
    let apiKey: String
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
}
