use vstd::prelude::*;
verus! {
        spec fn triangle(n: nat) -> nat
                decreases n,
         {
                if n == 0 {
                        0
                } else {
                        n + triangle((n - 1) as nat)
                }
        }

        fn rec_triangle(n: u32) -> (sum: u32)
                requires
                triangle(n as nat) < 0x1_0000_0000,
                ensures
                sum == triangle(n as nat),
        {

            if n == 0 {
                0
                } else {
                n + rec_triangle(n - 1)
                }
        }
    
        fn main() {
                //assert(triangle(2) == 3);
                assert(forall|i: nat| triangle(i) >= 0);
            }

}
