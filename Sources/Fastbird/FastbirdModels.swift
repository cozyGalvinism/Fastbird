public struct APIResponseObject<T, MT>: Decodable where T: Decodable, MT: Decodable {
    public let object: String
    public let attributes: T
    public let meta: Optional<MT>
}

public struct APIResponseList<T, MT>: Decodable where T: Decodable, MT: Decodable {
    public let object: String
    public let data: [T]
    public let meta: Optional<MT>
}

public struct APIResponsePagination: Decodable {
    public let total: Int
    public let count: Int
    public let perPage: Int
    public let currentPage: Int
    public let totalPages: Int
}

public struct APIResponsePaginationMetaData: Decodable {
    public let pagination: APIResponsePagination
}

public struct APIResponseServerMetaData: Decodable {
    public let isServerOwner: Bool
    public let userPermissions: [String]
}

public struct PteroClientServerSftpDetails: Decodable {
    public let ip: String
    public let port: Int
}

public struct PteroClientServerLimits: Decodable {
    public let memory: Int
    public let swap: Int
    public let disk: Int
    public let io: Int
    public let cpu: Int
}

public struct PteroClientServerFeatureLimits: Decodable {
    public let databases: Int
    public let allocations: Int
    public let backups: Int
}

public struct PteroClientServerRelationshipsAllocation: Decodable {
    public let id: Int
    public let ip: String
    public let ipAlias: Optional<String>
    public let port: Int
    public let notes: Optional<String>
    public let isDefault: Bool
}

public struct PteroClientServerRelationships: Decodable {
    public let allocations: APIResponseList<APIResponseObject<PteroClientServerRelationshipsAllocation, APIResponsePaginationMetaData>, APIResponsePaginationMetaData>
}

public struct PteroClientServer: Decodable {
    public let serverOwner: Bool
    public let identifier: String
    public let uuid: String
    public let name: String
    public let node: String
    public let description: String
    public let isSuspended: Bool
    public let isInstalling: Bool
    public let sftpDetails: PteroClientServerSftpDetails
    public let limits: PteroClientServerLimits
    public let featureLimits: PteroClientServerFeatureLimits
}

public struct PteroClientServerResources: Decodable {
    public let memoryBytes: Int
    public let cpuAbsolute: Double
    public let diskBytes: Int
    public let networkRxBytes: Int
    public let networkTxBytes: Int
}

public struct PteroClientServerResourceUsage: Decodable {
    public let currentState: String
    public let isSuspended: Bool
    public let resources: PteroClientServerResources
}