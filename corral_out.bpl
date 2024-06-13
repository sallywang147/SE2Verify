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

procedure {:public} culpritOne_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _tokens_s302: Ref, _weights_s302: Ref, indexTokens_s302: Ref, FixedPoint96_s302: int);
  modifies _totalWeights_Test, M_int_int;



implementation {:ForceInline} culpritOne_Test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _tokens_s302: Ref, _weights_s302: Ref, indexTokens_s302: Ref, FixedPoint96_s302: int)
{
  var _i_s122: int;
  var _xX96_s301: int;
  var _i_s227: int;
  var _i_s300: int;

  anon0:
    call {:si_unique_call 8} {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
    call {:si_unique_call 9} {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
    call {:si_unique_call 10} {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
    call {:si_unique_call 11} {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
    call {:si_unique_call 12} {:cexpr "FixedPoint96"} boogie_si_record_sol2Bpl_int(FixedPoint96_s302);
    call {:si_unique_call 13} {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
    goto corral_source_split_3;

  corral_source_split_3:
    goto corral_source_split_4;

  corral_source_split_4:
    assume Length[_tokens_s302] >= 0;
    assume Length[_weights_s302] >= 0;
    assume Length[_tokens_s302] == Length[_weights_s302];
    goto corral_source_split_5;

  corral_source_split_5:
    assume _i_s122 >= 0;
    assume Length[_tokens_s302] >= 0;
    goto corral_source_split_6;

  corral_source_split_6:
    havoc _i_s122;
    goto anon6_LoopHead;

  anon6_LoopHead:
    goto anon6_LoopDone, anon6_LoopBody;

  anon6_LoopBody:
    assume {:partition} _i_s122 < Length[_tokens_s302];
    goto corral_source_split_8;

  corral_source_split_8:
    goto corral_source_split_9;

  corral_source_split_9:
    assume _i_s122 >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assert M_int_int[_tokens_s302][_i_s122] >= 0;
    goto corral_source_split_10;

  corral_source_split_10:
    assume _totalWeights_Test[this] >= 0;
    assume _i_s122 >= 0;
    assume M_int_int[_weights_s302][_i_s122] >= 0;
    _totalWeights_Test[this] := _totalWeights_Test[this] + M_int_int[_weights_s302][_i_s122];
    call {:si_unique_call 14} {:cexpr "_totalWeights"} boogie_si_record_sol2Bpl_int(_totalWeights_Test[this]);
    goto corral_source_split_11;

  corral_source_split_11:
    assume _i_s122 >= 0;
    assume M_int_int[_weights_s302][_i_s122] >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume _i_s122 >= 0;
    assume M_int_int[_weights_s302][_i_s122] >= 0;
    assume _i_s122 >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assert M_int_int[_weights_s302][_i_s122] <= _totalWeights_Test[this] && _totalWeights_Test[this] <= M_int_int[_tokens_s302][_i_s122];
    goto corral_source_split_12;

  corral_source_split_12:
    assume _i_s122 >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assume M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s302][_i_s122]] >= 0;
    assume _i_s122 >= 0;
    M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s302][_i_s122]] := _i_s122;
    call {:si_unique_call 15} {:cexpr "_fundTokenIdx[_tokens[_i]]"} boogie_si_record_sol2Bpl_int(M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s302][_i_s122]]);
    goto corral_source_split_13;

  corral_source_split_13:
    assume _i_s122 >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assume M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s302][_i_s122]] >= 0;
    assert M_int_int[_fundTokenIdx_Test[this]][M_int_int[_tokens_s302][_i_s122]] >= 0;
    goto corral_source_split_14;

  corral_source_split_14:
    assume _i_s122 >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assume M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s302][_i_s122]] >= 0;
    M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s302][_i_s122]] := 1;
    call {:si_unique_call 16} {:cexpr "_isTokenInIndex[_tokens[_i]]"} boogie_si_record_sol2Bpl_int(M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s302][_i_s122]]);
    goto corral_source_split_15;

  corral_source_split_15:
    assume _i_s122 >= 0;
    assume M_int_int[_tokens_s302][_i_s122] >= 0;
    assume M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s302][_i_s122]] >= 0;
    assume _i_s122 >= 0;
    assume M_int_int[_weights_s302][_i_s122] >= 0;
    assert M_int_int[_isTokenInIndex_Test[this]][M_int_int[_tokens_s302][_i_s122]] == M_int_int[_weights_s302][_i_s122];
    goto corral_source_split_16;

  corral_source_split_16:
    assume FixedPoint96_s302 >= 0;
    call {:si_unique_call 17} culpritOne_Test(this, msgsender_MSG, msgvalue_MSG, _tokens_s302, _weights_s302, indexTokens_s302, FixedPoint96_s302);
    goto corral_source_split_17;

  corral_source_split_17:
    assume _i_s122 >= 0;
    _i_s122 := _i_s122 + 1;
    call {:si_unique_call 18} {:cexpr "_i"} boogie_si_record_sol2Bpl_int(_i_s122);
    assume _i_s122 >= 0;
    goto anon6_LoopHead;

  anon6_LoopDone:
    assume {:partition} Length[_tokens_s302] <= _i_s122;
    goto anon2;

  anon2:
    assume M_int_int[_weights_s302][0] >= 0;
    assert M_int_int[_weights_s302][0] > 0;
    goto corral_source_split_19;

  corral_source_split_19:
    assume _xX96_s301 >= 0;
    assume FixedPoint96_s302 >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume FixedPoint96_s302 * _totalWeights_Test[this] >= 0;
    assume M_int_int[_weights_s302][0] >= 0;
    assume FixedPoint96_s302 * _totalWeights_Test[this] div M_int_int[_weights_s302][0] >= 0;
    _xX96_s301 := FixedPoint96_s302 * _totalWeights_Test[this] div M_int_int[_weights_s302][0];
    call {:si_unique_call 19} {:cexpr "_xX96"} boogie_si_record_sol2Bpl_int(_xX96_s301);
    goto corral_source_split_20;

  corral_source_split_20:
    assume _xX96_s301 >= 0;
    assert _xX96_s301 > 0;
    goto corral_source_split_21;

  corral_source_split_21:
    assume Length[_tokens_s302] >= 0;
    assert Length[_tokens_s302] > 0;
    goto corral_source_split_22;

  corral_source_split_22:
    assume _i_s227 >= 0;
    assume Length[_tokens_s302] >= 0;
    goto corral_source_split_23;

  corral_source_split_23:
    havoc _i_s227;
    goto anon7_LoopHead;

  anon7_LoopHead:
    goto anon7_LoopDone, anon7_LoopBody;

  anon7_LoopBody:
    assume {:partition} _i_s227 < Length[_tokens_s302];
    goto corral_source_split_25;

  corral_source_split_25:
    goto corral_source_split_26;

  corral_source_split_26:
    assume _totalWeights_Test[this] >= 0;
    assert _totalWeights_Test[this] != 0;
    goto corral_source_split_27;

  corral_source_split_27:
    assume _i_s227 >= 0;
    assume M_int_int[indexTokens_s302][_i_s227] >= 0;
    assume _i_s227 >= 0;
    assume M_int_int[_weights_s302][_i_s227] >= 0;
    assume _xX96_s301 >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 >= 0;
    assume _i_s227 >= 0;
    assume M_int_int[_tokens_s302][_i_s227] >= 0;
    assume M_int_int[_tokens_s302][_i_s227] >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227] >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227] div _totalWeights_Test[this] >= 0;
    M_int_int[indexTokens_s302][_i_s227] := M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227] div _totalWeights_Test[this];
    call {:si_unique_call 20} {:cexpr "indexTokens[_i]"} boogie_si_record_sol2Bpl_int(M_int_int[indexTokens_s302][_i_s227]);
    goto corral_source_split_28;

  corral_source_split_28:
    assume _i_s227 >= 0;
    assume M_int_int[_weights_s302][_i_s227] >= 0;
    assume _xX96_s301 >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 >= 0;
    assume _i_s227 >= 0;
    assume M_int_int[_tokens_s302][_i_s227] >= 0;
    assume M_int_int[_tokens_s302][_i_s227] >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227] >= 0;
    assert M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227] > 0;
    goto corral_source_split_29;

  corral_source_split_29:
    assume _i_s227 >= 0;
    assume M_int_int[indexTokens_s302][_i_s227] >= 0;
    assume _i_s227 >= 0;
    assume M_int_int[_weights_s302][_i_s227] >= 0;
    assume _xX96_s301 >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 >= 0;
    assume _i_s227 >= 0;
    assume M_int_int[_tokens_s302][_i_s227] >= 0;
    assume M_int_int[_tokens_s302][_i_s227] >= 0;
    assume M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227] >= 0;
    assert M_int_int[indexTokens_s302][_i_s227] >= M_int_int[_weights_s302][_i_s227] * _xX96_s301 * M_int_int[_tokens_s302][_i_s227];
    goto corral_source_split_30;

  corral_source_split_30:
    assume _i_s227 >= 0;
    _i_s227 := _i_s227 + 1;
    call {:si_unique_call 21} {:cexpr "_i"} boogie_si_record_sol2Bpl_int(_i_s227);
    assume _i_s227 >= 0;
    goto anon7_LoopHead;

  anon7_LoopDone:
    assume {:partition} Length[_tokens_s302] <= _i_s227;
    goto anon4;

  anon4:
    assume _i_s300 >= 0;
    assume Length[_tokens_s302] >= 0;
    goto corral_source_split_32;

  corral_source_split_32:
    havoc _i_s300;
    goto anon8_LoopHead;

  anon8_LoopHead:
    goto anon8_LoopDone, anon8_LoopBody;

  anon8_LoopBody:
    assume {:partition} _i_s300 < Length[_tokens_s302];
    goto corral_source_split_34;

  corral_source_split_34:
    goto corral_source_split_35;

  corral_source_split_35:
    assume _totalWeights_Test[this] >= 0;
    assert _totalWeights_Test[this] != 0;
    goto corral_source_split_36;

  corral_source_split_36:
    assume _i_s300 >= 0;
    assume M_int_int[indexTokens_s302][_i_s300] >= 0;
    assume _i_s300 >= 0;
    assume M_int_int[_weights_s302][_i_s300] >= 0;
    assume _xX96_s301 >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 >= 0;
    assume _i_s300 >= 0;
    assume M_int_int[_tokens_s302][_i_s300] >= 0;
    assume M_int_int[_tokens_s302][_i_s300] >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300] >= 0;
    assume _totalWeights_Test[this] >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300] div _totalWeights_Test[this] >= 0;
    M_int_int[indexTokens_s302][_i_s300] := M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300] div _totalWeights_Test[this];
    call {:si_unique_call 22} {:cexpr "indexTokens[_i]"} boogie_si_record_sol2Bpl_int(M_int_int[indexTokens_s302][_i_s300]);
    goto corral_source_split_37;

  corral_source_split_37:
    assume _i_s300 >= 0;
    assume M_int_int[_weights_s302][_i_s300] >= 0;
    assume _xX96_s301 >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 >= 0;
    assume _i_s300 >= 0;
    assume M_int_int[_tokens_s302][_i_s300] >= 0;
    assume M_int_int[_tokens_s302][_i_s300] >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300] >= 0;
    assert M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300] > 0;
    goto corral_source_split_38;

  corral_source_split_38:
    assume _i_s300 >= 0;
    assume M_int_int[indexTokens_s302][_i_s300] >= 0;
    assume _i_s300 >= 0;
    assume M_int_int[_weights_s302][_i_s300] >= 0;
    assume _xX96_s301 >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 >= 0;
    assume _i_s300 >= 0;
    assume M_int_int[_tokens_s302][_i_s300] >= 0;
    assume M_int_int[_tokens_s302][_i_s300] >= 0;
    assume M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300] >= 0;
    assert M_int_int[indexTokens_s302][_i_s300] >= M_int_int[_weights_s302][_i_s300] * _xX96_s301 * M_int_int[_tokens_s302][_i_s300];
    goto corral_source_split_39;

  corral_source_split_39:
    assume _i_s300 >= 0;
    _i_s300 := _i_s300 + 1;
    call {:si_unique_call 23} {:cexpr "_i"} boogie_si_record_sol2Bpl_int(_i_s300);
    assume _i_s300 >= 0;
    goto anon8_LoopHead;

  anon8_LoopDone:
    assume {:partition} Length[_tokens_s302] <= _i_s300;
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
  var _tokens_s302: Ref;
  var _weights_s302: Ref;
  var indexTokens_s302: Ref;
  var FixedPoint96_s302: int;
  var tmpNow: int;

  anon0:
    havoc msgsender_MSG;
    havoc msgvalue_MSG;
    havoc choice;
    havoc _tokens_s302;
    havoc _weights_s302;
    havoc indexTokens_s302;
    havoc FixedPoint96_s302;
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
    call {:si_unique_call 24} _tokens_s302 := FreshRefGenerator();
    call {:si_unique_call 25} _weights_s302 := FreshRefGenerator();
    call {:si_unique_call 26} indexTokens_s302 := FreshRefGenerator();
    call {:si_unique_call 27} culpritOne_Test(this, msgsender_MSG, msgvalue_MSG, _tokens_s302, _weights_s302, indexTokens_s302, FixedPoint96_s302);
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
    call {:si_unique_call 28} this := FreshRefGenerator();
    assume now >= 0;
    assume DType[this] == Test;
    call {:si_unique_call 29} Test_Test(this, msgsender_MSG, msgvalue_MSG);
    goto anon2_LoopHead;

  anon2_LoopHead:
    goto anon2_LoopDone, anon2_LoopBody;

  anon2_LoopBody:
    assume {:partition} true;
    call {:si_unique_call 30} CorralChoice_Test(this);
    goto anon2_LoopHead;

  anon2_LoopDone:
    assume {:partition} !true;
    return;
}


