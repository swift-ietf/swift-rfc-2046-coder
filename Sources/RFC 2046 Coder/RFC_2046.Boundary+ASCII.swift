public import ASCII
public import ASCII_Serializer
public import Binary_Serializable
public import Byte
public import Parseable_ASCII
public import RFC_2046
import Byte_Standard_Library_Integration

extension RFC_2046.Boundary: @retroactive ASCII.Parseable {

    public init<Bytes: Swift.Collection>(ascii bytes: Bytes) throws(Error)
    where Bytes.Element == Byte {
        for byte in bytes {
            guard byte.bitPattern < 0x80 else {
                throw Error.notASCII(String(decoding: bytes, as: UTF8.self))
            }
        }
        try self.init(String(decoding: bytes, as: UTF8.self))
    }
}

extension RFC_2046.Boundary: @retroactive ASCII.Serializable,
    @retroactive Binary.Serializable
{

    public static func serialize<Buffer: RangeReplaceableCollection>(
        _ boundary: Self,
        into buffer: inout Buffer
    ) where Buffer.Element == ASCII.Code {
        Scan.append(boundary.rawValue, into: &buffer)
    }

    public static func serialize<Buffer: RangeReplaceableCollection>(
        _ boundary: Self,
        into buffer: inout Buffer
    ) where Buffer.Element == Byte {
        Scan.append(boundary.rawValue, into: &buffer)
    }
}

extension [Byte] {

    public init(_ boundary: RFC_2046.Boundary) {
        self = []
        RFC_2046.Boundary.serialize(boundary, into: &self)
    }
}
