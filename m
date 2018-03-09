From: parri.andrea@gmail.com (Andrea Parri)
Date: Fri, 9 Mar 2018 17:57:58 +0100
Subject: [PATCH v2 2/2] riscv/atomic: Strengthen implementations with
 fences
In-Reply-To: <Pine.LNX.4.44L0.1803091129420.2256-100000@iolanthe.rowland.org>
References: <1520597620-16650-1-git-send-email-parri.andrea@gmail.com>
 <Pine.LNX.4.44L0.1803091129420.2256-100000@iolanthe.rowland.org>
Message-ID: <20180309165758.GA24626@andrea>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Mar 09, 2018 at 11:39:11AM -0500, Alan Stern wrote:
> On Fri, 9 Mar 2018, Andrea Parri wrote:
> 
> > Atomics present the same issue with locking: release and acquire
> > variants need to be strengthened to meet the constraints defined
> > by the Linux-kernel memory consistency model [1].
> > 
> > Atomics present a further issue: implementations of atomics such
> > as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
> > which do not give full-ordering with .aqrl; for example, current
> > implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
> > below to end up with the state indicated in the "exists" clause.
> > 
> > In order to "synchronize" LKMM and RISC-V's implementation, this
> > commit strengthens the implementations of the atomics operations
> > by replacing .rl and .aq with the use of ("lightweigth") fences,
> > and by replacing .aqrl LR/SC pairs in sequences such as:
> > 
> >   0:      lr.w.aqrl  %0, %addr
> >           bne        %0, %old, 1f
> >           ...
> >           sc.w.aqrl  %1, %new, %addr
> >           bnez       %1, 0b
> >   1:
> > 
> > with sequences of the form:
> > 
> >   0:      lr.w       %0, %addr
> >           bne        %0, %old, 1f
> >           ...
> >           sc.w.rl    %1, %new, %addr   /* SC-release   */
> >           bnez       %1, 0b
> >           fence      rw, rw            /* "full" fence */
> >   1:
> > 
> > following Daniel's suggestion.
> > 
> > These modifications were validated with simulation of the RISC-V
> > memory consistency model.
> > 
> > C lr-sc-aqrl-pair-vs-full-barrier
> > 
> > {}
> > 
> > P0(int *x, int *y, atomic_t *u)
> > {
> > 	int r0;
> > 	int r1;
> > 
> > 	WRITE_ONCE(*x, 1);
> > 	r0 = atomic_cmpxchg(u, 0, 1);
> > 	r1 = READ_ONCE(*y);
> > }
> > 
> > P1(int *x, int *y, atomic_t *v)
> > {
> > 	int r0;
> > 	int r1;
> > 
> > 	WRITE_ONCE(*y, 1);
> > 	r0 = atomic_cmpxchg(v, 0, 1);
> > 	r1 = READ_ONCE(*x);
> > }
> > 
> > exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)
> 
> There's another aspect to this imposed by the LKMM, and I'm not sure
> whether your patch addresses it.  You add a fence after the cmpxchg
> operation but nothing before it.  So what would happen with the 
> following litmus test (which the LKMM forbids)?

Available RISC-V memory model formalizations forbid it;  an intuitive
explanation could probably be derived by paralleling the argument for
arm64, as pointed out by Daniel at:

  https://marc.info/?l=linux-kernel&m=151994289015267&w=2

  Andrea


> 
> C SB-atomic_cmpxchg-mb
> 
> {}
> 
> P0(int *x, int *y)
> {
> 	int r0;
> 
> 	WRITE_ONCE(*x, 1);
> 	r0 = atomic_cmpxchg(y, 0, 0);
> }
> 
> P1(int *x, int *y)
> {
> 	int r1;
> 
> 	WRITE_ONCE(*y, 1);
> 	smp_mb();
> 	r1 = READ_ONCE(*x);
> }
> 
> exists (0:r0=0 /\ 1:r1=0)
> 
> This is yet another illustration showing that full fences are stronger 
> than cominations of release + acquire.
> 
> Alan Stern
> 
