module

public import Dotnet.Basic

@[expose] public section

namespace System

open Dotnet


structure ArraySegment (T: Type) where
  protected _array : Ref (Array T)
  protected _offset : USize
  protected _count : USize

namespace ArraySegment

protected def ctor {T: Type} /-(array: Ref (Array T))-/ (offset: USize) (count: USize) : DN (ULift (Array T)) (ArraySegment T) := do
  let array := (← get).down
  if h: (offset > array.usize) ∨ (count > (array.usize - offset)) then
    throw ⟨.ArgumentOutOfRange, ""⟩
  else
    return ⟨array, offset, count⟩


end ArraySegment


end System

end
