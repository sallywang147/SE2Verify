use vstd::prelude::*;
verus! {


        fn rec_triangle(n: u32)  -> u32
                requires
                 n < 0x1_0000_0000,

        {
                let mut i = 0;
                while i < n {
                        let sum =  n + rec_triangle(n - 1);
                        n + rec_triangle(n - 1);
                        assert(sum < 0x1_0000_0000);
                        i += 1;
                };
                return i as u32;
        }

        fn main() {
                let n = rec_triangle(3);
            }

}
