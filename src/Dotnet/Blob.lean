module


public import Dotnet.Basic

/- dotnet-runtime\src\libraries\System.Reflection.Metadata\src\System\Reflection\Metadata\Blob.cs -/
@[expose] public section

namespace System.Reflection.Metadata

open Dotnet


structure Blob where
  protected Buffer : Ref ByteArray
  protected Start: USize
  protected Length: USize

namespace Blob


protected def IsDefault : DN Blob (ULift Bool) := do
  let array := (← get).Buffer.get
  return ⟨(array == default)⟩


end Blob


end System.Reflection.Metadata

end
