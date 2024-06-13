use vstd::prelude::*;
verus! {

mod M1 {
                use builtin::*;
            
                pub closed spec fn min(x: int, y: int) -> int {
                    if x <= y {
                        x
                    } else {
                        y
                    }
                }
            
                pub proof fn lemma_min(x: int, y: int)
                    ensures
                        min(x, y) <= x,
                        min(x, y) <= y,
                        min(x, y) == x || min(x, y) == y,
                {
                }
            }
            
        mod M2 {
                use builtin::*;
                use crate::M1::*;
            
                fn test() {
                    assert(min(10, 20) == 10) by {
                        lemma_min(10, 20);
                        lemma_min(100, 200);
                    }
                    assert(min(10, 20) == 10); // succeeds
                  //  assert(min(100, 200) == 100); // FAILS
                }
            }
            

  proof fn bound_check(x: u32, y: u32, z: u32)
        requires
            x <= 0xffff,
            y <= 0xffff,
           // z <= 0xffff,
    {
        assert(x * y <= 0x100000000) by (nonlinear_arith)
            requires
                x <= 0xffff,
                y <= 0xffff,
            //    z <= 0xffff,
        {
            // nonlinear_arith proof block does not have any surrounding facts by default
            // assert(z <= 0xffff);  <- Trivial, but fails since this property is not included in the `requires` clause
            assert(x * y <= 0x100000000);
        }
    }

    fn main() {
        assert(1==1)

    }

    
}
