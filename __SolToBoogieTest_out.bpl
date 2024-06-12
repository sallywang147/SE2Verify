type Ref;
type ContractName;
const unique null: Ref;
const unique Test: ContractName;
function ConstantToRef(x: int) returns (ret: Ref);
function BoogieRefToInt(x: Ref) returns (ret: int);
function {:bvbuiltin "mod"} modBpl(x: int, y: int) returns (ret: int);
function keccak256(x: int) returns (ret: int);
function abiEncodePacked1(x: int) returns (ret: int);
function _SumMapping_VeriSol(x: [Ref]int) returns (ret: int);
function abiEncodePacked2(x: int, y: int) returns (ret: int);
function abiEncodePacked1R(x: Ref) returns (ret: int);
function abiEncodePacked2R(x: Ref, y: int) returns (ret: int);
var Balance: [Ref]int;
var DType: [Ref]ContractName;
var Alloc: [Ref]bool;
var balance_ADDR: [Ref]int;
var M_int_int: [Ref][int]int;
var Length: [Ref]int;
var now: int;
procedure {:inline 1} FreshRefGenerator() returns (newRef: Ref);
implementation FreshRefGenerator() returns (newRef: Ref)
{
havoc newRef;
assume ((Alloc[newRef]) == (false));
Alloc[newRef] := true;
assume ((newRef) != (null));
}

procedure {:inline 1} HavocAllocMany();
implementation HavocAllocMany()
{
var oldAlloc: [Ref]bool;
oldAlloc := Alloc;
havoc Alloc;
assume (forall  __i__0_0:Ref ::  ((oldAlloc[__i__0_0]) ==> (Alloc[__i__0_0])));
}

procedure boogie_si_record_sol2Bpl_int(x: int);
procedure boogie_si_record_sol2Bpl_ref(x: Ref);
procedure boogie_si_record_sol2Bpl_bool(x: bool);

axiom(forall  __i__0_0:int, __i__0_1:int :: {ConstantToRef(__i__0_0), ConstantToRef(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((ConstantToRef(__i__0_0)) != (ConstantToRef(__i__0_1)))));

axiom(forall  __i__0_0:int, __i__0_1:int :: {keccak256(__i__0_0), keccak256(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((keccak256(__i__0_0)) != (keccak256(__i__0_1)))));

axiom(forall  __i__0_0:int, __i__0_1:int :: {abiEncodePacked1(__i__0_0), abiEncodePacked1(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((abiEncodePacked1(__i__0_0)) != (abiEncodePacked1(__i__0_1)))));

axiom(forall  __i__0_0:[Ref]int ::  ((exists __i__0_1:Ref ::  ((__i__0_0[__i__0_1]) != (0))) || ((_SumMapping_VeriSol(__i__0_0)) == (0))));

axiom(forall  __i__0_0:[Ref]int, __i__0_1:Ref, __i__0_2:int ::  ((_SumMapping_VeriSol(__i__0_0[__i__0_1 := __i__0_2])) == (((_SumMapping_VeriSol(__i__0_0)) - (__i__0_0[__i__0_1])) + (__i__0_2))));

axiom(forall  __i__0_0:int, __i__0_1:int, __i__1_0:int, __i__1_1:int :: {abiEncodePacked2(__i__0_0, __i__1_0), abiEncodePacked2(__i__0_1, __i__1_1)} ((((__i__0_0) == (__i__0_1)) && ((__i__1_0) == (__i__1_1))) || ((abiEncodePacked2(__i__0_0, __i__1_0)) != (abiEncodePacked2(__i__0_1, __i__1_1)))));

axiom(forall  __i__0_0:Ref, __i__0_1:Ref :: {abiEncodePacked1R(__i__0_0), abiEncodePacked1R(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((abiEncodePacked1R(__i__0_0)) != (abiEncodePacked1R(__i__0_1)))));

axiom(forall  __i__0_0:Ref, __i__0_1:Ref, __i__1_0:int, __i__1_1:int :: {abiEncodePacked2R(__i__0_0, __i__1_0), abiEncodePacked2R(__i__0_1, __i__1_1)} ((((__i__0_0) == (__i__0_1)) && ((__i__1_0) == (__i__1_1))) || ((abiEncodePacked2R(__i__0_0, __i__1_0)) != (abiEncodePacked2R(__i__0_1, __i__1_1)))));
procedure {:inline 1} Test_Test_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation Test_Test_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
var __var_2: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
_totalWeights_Test[this] := 0;
Q96_Test[this] := 0;
// Make array/mapping vars distinct for _fundTokenIdx
call __var_1 := FreshRefGenerator();
_fundTokenIdx_Test[this] := __var_1;
assume ((Length[_fundTokenIdx_Test[this]]) == (0));
// Make array/mapping vars distinct for _isTokenInIndex
call __var_2 := FreshRefGenerator();
_isTokenInIndex_Test[this] := __var_2;
assume ((Length[_isTokenInIndex_Test[this]]) == (0));
// end of initialization
}

procedure {:inline 1} Test_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation Test_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "/home/sallyjunsongwang/SE2Verify/./timeout1_variant5.sol"} {:sourceLine 5} (true);
call Test_Test_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var _totalWeights_Test: [Ref]int;
var Q96_Test: [Ref]int;
var _fundTokenIdx_Test: [Ref]Ref;
var _isTokenInIndex_Test: [Ref]Ref;
procedure {:public} {:inline 1} culpritOne_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _tokens_s65: Ref, _weights_s65: int, FixedPoint96_s65: int);
implementation culpritOne_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _tokens_s65: Ref, _weights_s65: int, FixedPoint96_s65: int)
{
var _xX96_s64: int;
var indexTokens_s64: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_weights"} boogie_si_record_sol2Bpl_int(_weights_s65);
call  {:cexpr "FixedPoint96"} boogie_si_record_sol2Bpl_int(FixedPoint96_s65);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "/home/sallyjunsongwang/SE2Verify/./timeout1_variant5.sol"} {:sourceLine 15} (true);
assert {:first} {:sourceFile "/home/sallyjunsongwang/SE2Verify/./timeout1_variant5.sol"} {:sourceLine 16} (true);
assume ((Length[_tokens_s65]) >= (0));
assume ((_weights_s65) >= (0));
assume ((Length[_tokens_s65]) == (_weights_s65));
assert {:first} {:sourceFile "/home/sallyjunsongwang/SE2Verify/./timeout1_variant5.sol"} {:sourceLine 17} (true);
assume ((_xX96_s64) >= (0));
assume ((FixedPoint96_s65) >= (0));
assume ((_totalWeights_Test[this]) >= (0));
assume ((((FixedPoint96_s65) + (_totalWeights_Test[this]))) >= (0));
assume ((_weights_s65) >= (0));
assume (((((FixedPoint96_s65) + (_totalWeights_Test[this]))) - (_weights_s65)) >= (0));
_xX96_s64 := (((FixedPoint96_s65) + (_totalWeights_Test[this]))) - (_weights_s65);
call  {:cexpr "_xX96"} boogie_si_record_sol2Bpl_int(_xX96_s64);
assert {:first} {:sourceFile "/home/sallyjunsongwang/SE2Verify/./timeout1_variant5.sol"} {:sourceLine 18} (true);
assume ((indexTokens_s64) >= (0));
assume ((_weights_s65) >= (0));
assume ((_xX96_s64) >= (0));
assume (((_weights_s65) + (_xX96_s64)) >= (0));
assume ((((_weights_s65) + (_xX96_s64)) + (10)) >= (0));
assume ((Q96_Test[this]) >= (0));
assume ((((((_weights_s65) + (_xX96_s64)) + (10)) + (Q96_Test[this]))) >= (0));
assume ((_totalWeights_Test[this]) >= (0));
assume (((((((_weights_s65) + (_xX96_s64)) + (10)) + (Q96_Test[this]))) - (_totalWeights_Test[this])) >= (0));
indexTokens_s64 := (((((_weights_s65) + (_xX96_s64)) + (10)) + (Q96_Test[this]))) - (_totalWeights_Test[this]);
call  {:cexpr "indexTokens"} boogie_si_record_sol2Bpl_int(indexTokens_s64);
assert {:first} {:sourceFile "/home/sallyjunsongwang/SE2Verify/./timeout1_variant5.sol"} {:sourceLine 19} (true);
assume ((indexTokens_s64) >= (0));
assume ((_weights_s65) >= (0));
assume ((_xX96_s64) >= (0));
assume (((_weights_s65) + (_xX96_s64)) >= (0));
assume ((((_weights_s65) + (_xX96_s64)) + (10)) >= (0));
assume ((Q96_Test[this]) >= (0));
assume ((((((_weights_s65) + (_xX96_s64)) + (10)) + (Q96_Test[this]))) >= (0));
assert ((indexTokens_s64) >= (((((_weights_s65) + (_xX96_s64)) + (10)) + (Q96_Test[this]))));
}

procedure {:inline 1} FallbackDispatch(from: Ref, to: Ref, amount: int);
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (Test)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(from, to, amount);
}
}

procedure {:inline 1} Fallback_UnknownType(from: Ref, to: Ref, amount: int);
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
// ---- Logic for payable function START 
assume ((Balance[from]) >= (amount));
Balance[from] := (Balance[from]) - (amount);
Balance[to] := (Balance[to]) + (amount);
// ---- Logic for payable function END 
}

procedure {:inline 1} send(from: Ref, to: Ref, amount: int) returns (success: bool);
implementation send(from: Ref, to: Ref, amount: int) returns (success: bool)
{
if ((Balance[from]) >= (amount)) {
call FallbackDispatch(from, to, amount);
success := true;
} else {
success := false;
}
}

procedure BoogieEntry_Test();
implementation BoogieEntry_Test()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _tokens_s65: Ref;
var _weights_s65: int;
var FixedPoint96_s65: int;
var tmpNow: int;
assume ((now) >= (0));
assume ((DType[this]) == (Test));
call Test_Test(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _tokens_s65;
havoc _weights_s65;
havoc FixedPoint96_s65;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (Test));
Alloc[msgsender_MSG] := true;
if ((choice) == (1)) {
call _tokens_s65 := FreshRefGenerator();
call culpritOne_Test(this, msgsender_MSG, msgvalue_MSG, _tokens_s65, _weights_s65, FixedPoint96_s65);
}
}
}

procedure CorralChoice_Test(this: Ref);
implementation CorralChoice_Test(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _tokens_s65: Ref;
var _weights_s65: int;
var FixedPoint96_s65: int;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _tokens_s65;
havoc _weights_s65;
havoc FixedPoint96_s65;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (Test));
Alloc[msgsender_MSG] := true;
if ((choice) == (1)) {
call _tokens_s65 := FreshRefGenerator();
call culpritOne_Test(this, msgsender_MSG, msgvalue_MSG, _tokens_s65, _weights_s65, FixedPoint96_s65);
}
}

procedure CorralEntry_Test();
implementation CorralEntry_Test()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((DType[this]) == (Test));
call Test_Test(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_Test(this);
}
}


