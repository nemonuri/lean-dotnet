module

/- dotnet-runtime\src\libraries\System.Reflection.Metadata\src\System\Reflection\Metadata\Blob.cs -/
@[expose] public section

namespace System.Reflection.Metadata

structure Blob where
  protected Buffer: Option ByteArray
  protected Start: Int32
  protected Length: Int32

namespace Blob

variable (self: Blob)

protected def IsDefault : Bool := self.Buffer == .none

end Blob


end System.Reflection.Metadata

end
