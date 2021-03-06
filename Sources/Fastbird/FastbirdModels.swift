public struct APIResponseObject<T, MT>: Decodable, Hashable where T: Decodable, T: Hashable, MT: Decodable, MT: Hashable {
    public let object: String
    public let attributes: T
    public let meta: Optional<MT>

    public init(object: String, attributes: T, meta: Optional<MT>) {
        self.object = object
        self.attributes = attributes
        self.meta = meta
    }
}

public struct APIResponseList<T, MT>: Decodable, Hashable where T: Decodable, MT: Decodable, T: Hashable, MT: Hashable {
    public let object: String
    public let data: [T]
    public let meta: Optional<MT>

    public init(object: String, data: [T], meta: Optional<MT>) {
        self.object = object
        self.data = data
        self.meta = meta
    }
}

public struct APIResponsePagination: Decodable, Hashable {
    public let total: Int
    public let count: Int
    public let perPage: Int
    public let currentPage: Int
    public let totalPages: Int

    public init(total: Int, count: Int, perPage: Int, currentPage: Int, totalPages: Int) {
        self.total = total
        self.count = count
        self.perPage = perPage
        self.currentPage = currentPage
        self.totalPages = totalPages
    }
}

public struct APIResponsePaginationMetaData: Decodable, Hashable {
    public let pagination: APIResponsePagination

    public init(pagination: APIResponsePagination) {
        self.pagination = pagination
    }
}

public struct APIResponseServerMetaData: Decodable, Hashable {
    public let isServerOwner: Bool
    public let userPermissions: [String]

    public init(isServerOwner: Bool, userPermissions: [String]) {
        self.isServerOwner = isServerOwner
        self.userPermissions = userPermissions
    }
}

public struct PteroClientServerSftpDetails: Decodable, Hashable {
    public let ip: String
    public let port: Int

    public init(ip: String, port: Int) {
        self.ip = ip
        self.port = port
    }
}

public struct PteroClientServerLimits: Decodable, Hashable {
    public let memory: Int
    public let swap: Int
    public let disk: Int
    public let io: Int
    public let cpu: Int

    public init(memory: Int, swap: Int, disk: Int, io: Int, cpu: Int) {
        self.memory = memory
        self.swap = swap
        self.disk = disk
        self.io = io
        self.cpu = cpu
    }
}

public struct PteroClientServerFeatureLimits: Decodable, Hashable {
    public let databases: Int
    public let allocations: Int
    public let backups: Int

    public init(databases: Int, allocations: Int, backups: Int) {
        self.databases = databases
        self.allocations = allocations
        self.backups = backups
    }
}

public struct PteroClientServerRelationshipsAllocation: Decodable, Hashable {
    public let id: Int
    public let ip: String
    public let ipAlias: Optional<String>
    public let port: Int
    public let notes: Optional<String>
    public let isDefault: Bool

    public init(id: Int, ip: String, ipAlias: Optional<String>, port: Int, notes: Optional<String>, isDefault: Bool) {
        self.id = id
        self.ip = ip
        self.ipAlias = ipAlias
        self.port = port
        self.notes = notes
        self.isDefault = isDefault
    }
}

public struct PteroClientServerRelationships: Decodable, Hashable {
    public let allocations: APIResponseList<APIResponseObject<PteroClientServerRelationshipsAllocation, APIResponsePaginationMetaData>, APIResponsePaginationMetaData>

    public init(allocations: APIResponseList<APIResponseObject<PteroClientServerRelationshipsAllocation, APIResponsePaginationMetaData>, APIResponsePaginationMetaData>) {
        self.allocations = allocations
    }
}

public struct PteroClientServer: Decodable, Hashable {
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
    public let relationships: PteroClientServerRelationships

    public init(serverOwner: Bool, identifier: String, uuid: String, name: String, node: String, description: String, isSuspended: Bool, isInstalling: Bool, sftpDetails: PteroClientServerSftpDetails, limits: PteroClientServerLimits, featureLimits: PteroClientServerFeatureLimits, relationships: PteroClientServerRelationships) {
        self.serverOwner = serverOwner
        self.identifier = identifier
        self.uuid = uuid
        self.name = name
        self.node = node
        self.description = description
        self.isSuspended = isSuspended
        self.isInstalling = isInstalling
        self.sftpDetails = sftpDetails
        self.limits = limits
        self.featureLimits = featureLimits
        self.relationships = relationships
    }
}

public struct PteroClientServerResources: Decodable, Hashable {
    public let memoryBytes: Int
    public let cpuAbsolute: Double
    public let diskBytes: Int
    public let networkRxBytes: Int
    public let networkTxBytes: Int

    public init(memoryBytes: Int, cpuAbsolute: Double, diskBytes: Int, networkRxBytes: Int, networkTxBytes: Int) {
        self.memoryBytes = memoryBytes
        self.cpuAbsolute = cpuAbsolute
        self.diskBytes = diskBytes
        self.networkRxBytes = networkRxBytes
        self.networkTxBytes = networkTxBytes
    }
}

public struct PteroClientServerResourceUsage: Decodable, Hashable {
    public let currentState: String
    public let isSuspended: Bool
    public let resources: PteroClientServerResources

    public init(currentState: String, isSuspended: Bool, resources: PteroClientServerResources) {
        self.currentState = currentState
        self.isSuspended = isSuspended
        self.resources = resources
    }
}