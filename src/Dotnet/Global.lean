module

public import Mathlib.Data.List.AList

@[expose] public section

namespace System

structure RuntimeTypeHandle where
  value: ISize
  deriving Repr, DecidableEq



end System


namespace Dotnet

inductive Corlib : String → Type 0 → Type 1 where


/- https://github.com/stakx/ecma-335/blob/master/docs/ii.14.4.2-managed-pointers.md -/
structure ManagedPointer where
  value: USize
  /- Managed pointers cannot be null -/
  not_null: value ≠ 0


--structure GC where
--  alist:

--def Obj? (α: Type) : Type := Option α

--def Obj (α: Type) : Type := { x : Obj? α // }


/-

-/

end Dotnet


end
