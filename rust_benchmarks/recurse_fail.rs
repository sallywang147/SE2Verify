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


        fn rec_triangle(n: u32) -> u32
                requires
                triangle(n as nat) < 0x1_0000_0000,
        {
                let mut i = 0;
                let n = 32;
                while i < n {
                        i += 1;
                        if n == 0 {
                         return 0 as u32;
                        } else {
                         return n + rec_triangle(n - 1) as u32; 
                        }
                        //return (i += 1) as u32;
            }
           return n
        }
    
        fn main() {
                //assert(triangle(2) == 3);
                assert(forall|i: nat| triangle(i) >= 0);
            }

}
