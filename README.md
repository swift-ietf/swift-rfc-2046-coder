# swift-rfc-2046-coder

Wire coders for [swift-rfc-2046](https://github.com/swift-ietf/swift-rfc-2046): `RFC_2046.Multipart.Coder`, `RFC_2046.BodyPart.Coder`, `RFC_2046.BodyPart.Headers.Coder`, `RFC_2046.Boundary.Coder` and `RFC_2046.Multipart.Subtype.Coder` parse and serialize the multipart wire forms over any byte cursor, `RFC_2046.QuotedPrintable` provides the quoted-printable transfer codec, and the `ASCII.Parseable`, `ASCII.Serializable` and `Binary.Serializable` conformances live here so that the domain package stays a pure model.
