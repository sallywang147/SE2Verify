type Ref;

type ContractName;

const unique null: Ref;

const unique Test: ContractName;

function ConstantToRef(x: int) : Ref;

function BoogieRefToInt(x: Ref) : int;

function {:bvbuiltin "mod"} modBpl(x: int, y: int) : int;

function keccak256(x: int) : int;

function abiEncodePacked1(x: int) : int;

function _SumMapping_VeriSol(x: [Ref]int) : int;

function abiEncodePacked2(x: int, y: int) : int;

function abiEncodePacked1R(x: Ref) : int;

function abiEncodePacked2R(x: Ref, y: int) : int;

var Balance: [Ref]int;

var DType: [Ref]ContractName;

var Alloc: [Ref]bool;

var balance_ADDR: [Ref]int;

var M_int_int: [Ref][int]int;

var Length: [Ref]int;

var now: int;

procedure FreshRefGenerator() returns (newRef: Ref);
  modifies Alloc;



implementation {:ForceInline} FreshRefGenerator() returns (newRef: Ref)
{

  anon0:
    havoc newRef;
    assume Alloc[newRef] <==> false;
    Alloc[newRef] := true;
    assume newRef != null;
    return;
}



procedure HavocAllocMany();



procedure boogie_si_record_sol2Bpl_int(x: int);



procedure boogie_si_record_sol2Bpl_ref(x: Ref);



procedure boogie_si_record_sol2Bpl_bool(x: bool);



axiom (forall __i__0_0: int, __i__0_1: int :: { ConstantToRef(__i__0_0), ConstantToRef(__i__0_1) } __i__0_0 == __i__0_1 || ConstantToRef(__i__0_0) != ConstantToRef(__i__0_1));

axiom (forall __i__0_0: int, __i__0_1: int :: { keccak256(__i__0_0), keccak256(__i__0_1) } __i__0_0 == __i__0_1 || keccak256(__i__0_0) != keccak256(__i__0_1));

axiom (forall __i__0_0: int, __i__0_1: int :: { abiEncodePacked1(__i__0_0), abiEncodePacked1(__i__0_1) } __i__0_0 == __i__0_1 || abiEncodePacked1(__i__0_0) != abiEncodePacked1(__i__0_1));

axiom (forall __i__0_0: [Ref]int :: (exists __i__0_1: Ref :: __i__0_0[__i__0_1] != 0) || _SumMapping_VeriSol(__i__0_0) == 0);

axiom (forall __i__0_0: [Ref]int, __i__0_1: Ref, __i__0_2: int :: _SumMapping_VeriSol(__i__0_0[__i__0_1 := __i__0_2]) == _SumMapping_VeriSol(__i__0_0) - __i__0_0[__i__0_1] + __i__0_2);

axiom (forall __i__0_0: int, __i__0_1: int, __i__1_0: int, __i__1_1: int :: { abiEncodePacked2(__i__0_0, __i__1_0), abiEncodePacked2(__i__0_1, __i__1_1) } (__i__0_0 == __i__0_1 && __i__1_0 == __i__1_1) || abiEncodePacked2(__i__0_0, __i__1_0) != abiEncodePacked2(__i__0_1, __i__1_1));

axiom (forall __i__0_0: Ref, __i__0_1: Ref :: { abiEncodePacked1R(__i__0_0), abiEncodePacked1R(__i__0_1) } __i__0_0 == __i__0_1 || abiEncodePacked1R(__i__0_0) != abiEncodePacked1R(__i__0_1));

axiom (forall __i__0_0: Ref, __i__0_1: Ref, __i__1_0: int, __i__1_1: int :: { abiEncodePacked2R(__i__0_0, __i__1_0), abiEncodePacked2R(__i__0_1, __i__1_1) } (__i__0_0 == __i__0_1 && __i__1_0 == __i__1_1) || abiEncodePacked2R(__i__0_0, __i__1_0) != abiEncodePacked2R(__i__0_1, __i__1_1));

procedure Test_Test_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
  modifies Balance, _totalWeights_Test, Q96_Test, Alloc, _fundTokenIdx_Test, _isTokenInIndex_Test;



implementation {:ForceInline} Test_Test_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
  var __var_1: Ref;
  var __var_2: Ref;

  anon0:
    assume msgsender_MSG != null;
    Balance[this] := 0;
    _totalWeights_Test[this] := 0;
    Q96_Test[this] := 0;
    call {:si_unique_call 0} __var_1 := FreshRefGenerator();
    _fundTokenIdx_Test[this] := __var_1;
    assume Length[_fundTokenIdx_Test[this]] == 0;
    call {:si_unique_call 1} __var_2 := FreshRefGenerator();
    _isTokenInIndex_Test[this] := __var_2;
    assume Length[_isTokenInIndex_Test[this]] == 0;
    return;
}



procedure Test_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
  modifies Balance, _totalWeights_Test, Q96_Test, Alloc, _fundTokenIdx_Test, _isTokenInIndex_Test;



implementation {:ForceInline} Test_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{

  anon0:
    call {:si_unique_call 2} {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
    call {:si_unique_call 3} {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
    call {:si_unique_call 4} {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
    call {:si_unique_call 5} {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
    call {:si_unique_call 6} {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
    goto corral_source_split_1;

  corral_source_split_1:
    call {:si_unique_call 7} Test_Test_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
    return;
}



var _totalWeights_Test: [Ref]int;

var Q96_Test: [Ref]int;

var _fundTokenIdx_Test: [Ref]Ref;

var _isTokenInIndex_Test: [Ref]Ref;

procedure {:public} culpritOne_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _tokens_s130: Ref, _weights_s130: Ref, indexTokens_s130: Ref, FixedPoint96_s130: int);
  modifies _totalWeights_Test, M_int_int;



implementation {:ForceInline} culpritOne_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _tokens_s130: Ref, _weights_s130: Ref, indexTokens_s130: Ref, FixedPoint96_s130: int)
{
  var _i_s67: int;
  var _xX96_s129: int;
  var _i_s128: int;

  anon0:
    call {:si_unique_call 8} {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
    call {:si_unique_call 9} {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
    call {:si_unique_call 10} {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
    call {:si_unique_call 11} {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
    call {:si_unique_call 12} {:cexpr "FixedPoint96"} boogie_si_record_sol2Bpl_int(FixedPoint96_s130);
    call {:si_unique_call 13} {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
    goto corral_source_split_3;

  corral_source_split_3:
    goto corral_source_split_4;

  corral_source_split_4:
    assume Length[_tokens_s130] >= 0;
    assume Length[_weights_s130] >= 0;
    assume Length[_tokens_s130] == Length[_weights_s130];
    goto corral_source_split_5;

  corral_source_split_5:
    assume _i_s67 >= 0;
    assume Length[_tokens_s130] >= 0;
    goto corral_source_split_6;

  corral_source_split_6:
    havoc _i_s67;
    goto anon4_LoopHead;

  anon4_LoopHead:
    goto anon4_LoopDone, anon4_LoopBody;

  anon4_LoopBody:
    assume {:partition} _i_s67 < Length[_tokens_s130];
    goto corral_source_split_8;

  corral_source_split_8:
    goto corral_source_split_9;

  corral_source_split_9:
    assume _totalWeights_Test[this] >= 0;
    assume _i_s67 >= 0;
    assume M_int_int[_weights_s130][_i_s67] >= 0;
    _totalWeights_Test[this] := _totalWeights_Test[this] + M_int_int[_weights_s130][_i_s67];
    call {:si_unique_call 14} {:cexpr "_totalWeights"} boogie_si_record_sol2Bpl_int(_totalWeights_Test[this]);
    goto corral_source_split_10;

  corral_source_split_10:
    assume _i_s67 >= 0;
    assume M_int_int[_tokens_s130][_i_s67] >= 0;
    assume M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s130][_i_s67]] >= 0;
    assume _i_s67 >= 0;
    M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s130][_i_s67]] := _i_s67;
    call {:si_unique_call 15} {:cexpr "_fundTokenIdx[_tokens[_i]]"} boogie_si_record_sol2Bpl_int(M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s130][_i_s67]]);
    goto corral_source_split_11;

  corral_source_split_11:
    assume _i_s67 >= 0;
    assume M_int_int[_tokens_s130][_i_s67] >= 0;
    assume M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s130][_i_s67]] >= 0;
    M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s130][_i_s67]] := 1;
    call {:si_unique_call 16} {:cexpr "_isTokenInIndex[_tokens[_i]]"} boogie_si_record_sol2Bpl_int(M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s130][_i_s67]]);
    goto corral_source_split_12;

  corral_source_split_12:
    assume _i_s67 >= 0;
    _i_s67 := _i_s67 + 1;
    call {:si_unique_call 17} {:cexpr "_i"} boogie_si_record_sol2Bpl_int(_i_s67);
    assume _i_s67 >= 0;
    goto anon4_LoopHead;

  anon4_LoopDone:
    assume {:partition} Length[_tokens_s130] <= _i_s67;
    goto anon2;

  anon2:
    assume _xX96_s129 >= 0;
    assume FixedPoint96_s130 >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume FixedPoint96_s130 + _totalWeights_Test[this] >= 0;
    assume M_int_int[_weights_s130][0] >= 0;
    assume FixedPoint96_s130 + _totalWeights_Test[this] - M_int_int[_weights_s130][0] >= 0;
    _xX96_s129 := FixedPoint96_s130 + _totalWeights_Test[this] - M_int_int[_weights_s130][0];
    call {:si_unique_call 18} {:cexpr "_xX96"} boogie_si_record_sol2Bpl_int(_xX96_s129);
    goto corral_source_split_14;

  corral_source_split_14:
    assume _i_s128 >= 0;
    assume Length[_tokens_s130] >= 0;
    goto corral_source_split_15;

  corral_source_split_15:
    havoc _i_s128;
    goto anon5_LoopHead;

  anon5_LoopHead:
    goto anon5_LoopDone, anon5_LoopBody;

  anon5_LoopBody:
    assume {:partition} _i_s128 < Length[_tokens_s130];
    goto corral_source_split_17;

  corral_source_split_17:
    goto corral_source_split_18;

  corral_source_split_18:
    assume _i_s128 >= 0;
    assume M_int_int[indexTokens_s130][_i_s128] >= 0;
    assume _i_s128 >= 0;
    assume M_int_int[_weights_s130][_i_s128] >= 0;
    assume _xX96_s129 >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 >= 0;
    assume _i_s128 >= 0;
    assume M_int_int[_tokens_s130][_i_s128] >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 + M_int_int[_tokens_s130][_i_s128] >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 + M_int_int[_tokens_s130][_i_s128] - _totalWeights_Test[this] >= 0;
    M_int_int[indexTokens_s130][_i_s128] := M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 + M_int_int[_tokens_s130][_i_s128] - _totalWeights_Test[this];
    call {:si_unique_call 19} {:cexpr "indexTokens[_i]"} boogie_si_record_sol2Bpl_int(M_int_int[indexTokens_s130][_i_s128]);
    goto corral_source_split_19;

  corral_source_split_19:
    assume _i_s128 >= 0;
    assume M_int_int[indexTokens_s130][_i_s128] >= 0;
    assume _i_s128 >= 0;
    assume M_int_int[_weights_s130][_i_s128] >= 0;
    assume _xX96_s129 >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 >= 0;
    assume _i_s128 >= 0;
    assume M_int_int[_tokens_s130][_i_s128] >= 0;
    assume M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 + M_int_int[_tokens_s130][_i_s128] >= 0;
    assert M_int_int[indexTokens_s130][_i_s128] >= M_int_int[_weights_s130][_i_s128] + _xX96_s129 + 10 + M_int_int[_tokens_s130][_i_s128];
    goto corral_source_split_20;

  corral_source_split_20:
    assume _i_s128 >= 0;
    _i_s128 := _i_s128 + 1;
    call {:si_unique_call 20} {:cexpr "_i"} boogie_si_record_sol2Bpl_int(_i_s128);
    assume _i_s128 >= 0;
    goto anon5_LoopHead;

  anon5_LoopDone:
    assume {:partition} Length[_tokens_s130] <= _i_s128;
    return;
}



procedure FallbackDispatch(from: Ref, to: Ref, amount: int);



procedure Fallback_UnknownType(from: Ref, to: Ref, amount: int);



procedure send(from: Ref, to: Ref, amount: int) returns (success: bool);



procedure BoogieEntry_Test();



procedure CorralChoice_Test(this: Ref);
  modifies now, Alloc, _totalWeights_Test, M_int_int;



implementation CorralChoice_Test(this: Ref)
{
  var msgsender_MSG: Ref;
  var msgvalue_MSG: int;
  var choice: int;
  var _tokens_s130: Ref;
  var _weights_s130: Ref;
  var indexTokens_s130: Ref;
  var FixedPoint96_s130: int;
  var tmpNow: int;

  anon0:
    havoc msgsender_MSG;
    havoc msgvalue_MSG;
    havoc choice;
    havoc _tokens_s130;
    havoc _weights_s130;
    havoc indexTokens_s130;
    havoc FixedPoint96_s130;
    havoc tmpNow;
    tmpNow := now;
    havoc now;
    assume now > tmpNow;
    assume msgsender_MSG != null;
    assume DType[msgsender_MSG] != Test;
    Alloc[msgsender_MSG] := true;
    goto anon2_Then, anon2_Else;

  anon2_Then:
    assume {:partition} choice == 1;
    call {:si_unique_call 21} _tokens_s130 := FreshRefGenerator();
    call {:si_unique_call 22} _weights_s130 := FreshRefGenerator();
    call {:si_unique_call 23} indexTokens_s130 := FreshRefGenerator();
    call {:si_unique_call 24} culpritOne_Test(this, msgsender_MSG, msgvalue_MSG, _tokens_s130, _weights_s130, indexTokens_s130, FixedPoint96_s130);
    return;

  anon2_Else:
    assume {:partition} choice != 1;
    return;
}



procedure CorralEntry_Test();
  modifies Alloc, Balance, _totalWeights_Test, Q96_Test, _fundTokenIdx_Test, _isTokenInIndex_Test, now, M_int_int;



implementation CorralEntry_Test()
{
  var this: Ref;
  var msgsender_MSG: Ref;
  var msgvalue_MSG: int;

  anon0:
    call {:si_unique_call 25} this := FreshRefGenerator();
    assume now >= 0;
    assume DType[this] == Test;
    call {:si_unique_call 26} Test_Test(this, msgsender_MSG, msgvalue_MSG);
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} true;
    call {:si_unique_call 27} CorralChoice_Test(this);
    goto anon2_LoopHead;

  anon2_LoopDone:
    assume {:partition} !true;
    return;
}


