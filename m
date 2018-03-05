From: parri.andrea@gmail.com (Andrea Parri)
Date: Mon, 5 Mar 2018 20:05:40 +0100
Subject: [RFC PATCH 2/2] riscv/atomic: Strengthen implementations with
 fences
In-Reply-To: <1520274276-21871-1-git-send-email-parri.andrea@gmail.com>
References: <1520274276-21871-1-git-send-email-parri.andrea@gmail.com>
Message-ID: <20180305190540.GA4531@andrea>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Mar 05, 2018 at 07:24:36PM +0100, Andrea Parri wrote:
> Atomics present the same issue with locking: release and acquire
> variants need to be strengthened to meet the constraints defined
> by the Linux-kernel memory consistency model [1].
> 
> Atomics present a further issue: implementations of atomics such
> as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
> which do not give full-ordering with .aqrl; for example, current
> implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
> below to end up with the state indicated in the "exists" clause.
> 
> In order to "synchronize" LKMM and RISC-V's implementation, this
> commit strengthens the implementations of the atomics operations
> by replacing .rl and .aq with the use of ("lightweigth") fences,
> and by replacing .aqrl LR/SC pairs in sequences such as:
> 
>   0:      lr.w.aqrl  %0, %addr
>           bne        %0, %old, 1f
>           ...
>           sc.w.aqrl  %1, %new, %addr
>           bnez       %1, 0b
>   1:
> 
> with sequences of the form:
> 
>   0:      lr.w       %0, %addr
>           bne        %0, %old, 1f
>           ...
>           sc.w.rl    %1, %new, %addr   /* SC-release   */
>           bnez       %1, 0b
>           fence      rw, rw            /* "full" fence */
>   1:
> 
> following Daniel's suggestion.
> 
> These modifications were validated with simulation of the RISC-V
> memory consistency model.
> 
> C lr-sc-aqrl-pair-vs-full-barrier
> 
> {}
> 
> P0(int *x, int *y, atomic_t *u)
> {
> 	int r0;
> 	int r1;
> 
> 	WRITE_ONCE(*x, 1);
> 	r0 = atomic_cmpxchg(u, 0, 1);
> 	r1 = READ_ONCE(*y);
> }
> 
> P1(int *x, int *y, atomic_t *v)
> {
> 	int r0;
> 	int r1;
> 
> 	WRITE_ONCE(*y, 1);
> 	r0 = atomic_cmpxchg(v, 0, 1);
> 	r1 = READ_ONCE(*x);
> }
> 
> exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)
> 
> [1] https://marc.info/?l=linux-kernel&m=151930201102853&w=2
>     https://groups.google.com/a/groups.riscv.org/forum/#!topic/isa-dev/hKywNHBkAXM
>     https://marc.info/?l=linux-kernel&m=151633436614259&w=2
> 
> Suggested-by: Daniel Lustig <dlustig@nvidia.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <albert@sifive.com>
> Cc: Daniel Lustig <dlustig@nvidia.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Jade Alglave <j.alglave@ucl.ac.uk>
> Cc: Luc Maranget <luc.maranget@inria.fr>
> Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
> Cc: Akira Yokosawa <akiyks@gmail.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: linux-riscv at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org

[...]

> +static __always_inline							\
> +c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)		\
> +{									\
> +	return __xchg_acquire(&(v->counter), n, size);			\
> +}									\

[...]

> +static __always_inline							\
> +c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,		\
> +				     c_t o, c_t n)			\
> +{									\
> +	return __cmpxchg_acquire(&(v->counter), o, n, size);		\
> +}									\

These better be _release in v2 ...

  Andrea
