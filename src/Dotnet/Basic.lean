module

public import Batteries.Control.LawfulMonadState

@[expose] public section
set_option autoImplicit false

universe u

namespace Dotnet

inductive ExnKind where
  | protected ArgumentNull
  | protected ArgumentOutOfRange
  deriving DecidableEq, Repr

structure PExn : Type u where
  kind: ExnKind
  msg: String
  deriving DecidableEq, Repr

def Exn := PExn.{0}

def Exn.mk (kind: ExnKind) (msg: String) : Exn := PExn.mk.{0} kind msg

--abbrev O? (T: Type) : Type 1 := (α: Type) → EStateM Exn (Option T) α --MonadStateOf (Option T) Id

def DN (T: Type u) := EStateM PExn T

namespace DN

open EStateM
--protected def pure (a: α) : DN T α := EStateM.pure a

instance instMonad {T} : Monad (DN T) where
  bind     := EStateM.bind
  pure     := EStateM.pure
  map      := EStateM.map
  seqRight := EStateM.seqRight


instance {δ T α} [Backtrackable δ T] : OrElse (DN T α) where
  orElse := EStateM.orElse

instance instMonadStateOf {T} : MonadStateOf T (DN T) where
  set       := EStateM.set
  get       := EStateM.get
  modifyGet := EStateM.modifyGet

--protected def throw {T α} (exn: Exn) : DN T α := EStateM.throw (ULift.up exn)

instance {δ T} [Backtrackable δ T] : MonadExceptOf PExn (DN T) where
  throw    := EStateM.throw
  tryCatch := EStateM.tryCatch

end DN


structure Ref (T: Type u) where --:= Cslib.FreeM.StateF T
  state: MonadStateOf T Id
  lawful: LawfulMonadStateOf T Id


def Ref.get {T} (ref: Ref T) : T := ref.state.get

def Ref.set {T} (ref: Ref T) (value: T) : PUnit := ref.state.set value

namespace Thunk

variable {α: Type u}



end Thunk


/-
def Ref.ofThunk {T: Type u} (th: Thunk T) : Ref T :=
  let stateM (α: Type u) : StateM T α :=
-/

end Dotnet



end
