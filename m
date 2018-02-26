From: luc.maranget@inria.fr (Luc Maranget)
Date: Mon, 26 Feb 2018 15:21:07 +0100
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <563431d0-4fb5-9efd-c393-83cc5197e934@nvidia.com>
References: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
 <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
 <20180222182717.GS25181@hirez.programming.kicks-ass.net>
 <563431d0-4fb5-9efd-c393-83cc5197e934@nvidia.com>
Message-ID: <20180226142107.uid5vtv5r7zbso33@yquem.inria.fr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> On 2/22/2018 10:27 AM, Peter Zijlstra wrote:
> > On Thu, Feb 22, 2018 at 10:13:17AM -0800, Paul E. McKenney wrote:
> >> So we have something that is not all that rare in the Linux kernel
> >> community, namely two conflicting more-or-less concurrent changes.
> >> This clearly needs to be resolved, either by us not strengthening the
> >> Linux-kernel memory model in the way we were planning to or by you
> >> strengthening RISC-V to be no weaker than PowerPC for these sorts of
> >> externally viewed release-acquire situations.
> >>
> >> Other thoughts?
> > 
> > Like said in the other email, I would _much_ prefer to not go weaker
> > than PPC, I find that PPC is already painfully weak at times.
> 
> Sure, and RISC-V could make this work too by using RCsc instructions
> and/or by using lightweight fences instead.  It just wasn't clear at
> first whether smp_load_acquire() and smp_store_release() were RCpc,
> RCsc, or something else, 

As far as I now understand, they are something else. Something in-between.

Basically, considering a multi-copy atomic model, and following RISCV
axiomatic herd notations

RCpc
   [Acq];po in ppo (ie Acquire "half barrier")
   po;[Rel] in ppo (ie Release "half barrier")

RCsc adds the rule
   [Rel];po;[Acq] in ppo. (ie Store release followed by load Acquire is
                          kept in order)

While LKMM has a less constrained additional rule
   [Rel];po-loc;[Acq]     (ie Store release followed by load Acquire from
                          the SAME location is  kept in order)
(For specialists LKMM is formulated differently, the overall
effect is the same)

> and hence whether RISC-V would actually need
> to use something stronger than pure RCpc there.  Likewise for
> spin_unlock()/spin_lock() and everywhere else this comes up.
On may here observe that the LKMM rule is here precisely to
forbid Andrea's test. In that aspect,the suggested RISCv implemention
of lock and unlock on spinlock_t is too weak as it allows the test.

However, I cannot conclude on smp_load_acquire/smp_store_release (see below).

> 
> As Paul's email in the other thread observed, RCpc seems to be
> OK for smp_load_acquire()/smp_store_release() at least according
> to the current LKMM herd spec.  Unlock/lock are stronger already
> I guess.  But if there's an active proposal to strengthen them all
> to something stricter than pure RCpc, then that's good to know.

As illustrated above  RCpc is not enough to implement LLKM
smp_load_acquire()/smp_store_release(). However, I do not know
for sure what the current implementation of smp_load_acquire()
and smp_store_release() (ie LLKM primitives) in RISCV.
As far as I could find the current implementation is the generic default
that uses strong fences and is safe.

On a related note, it may not be clear yet to everyone
that LLKM has "platonic spinlocks".

That is, locks are not implemented from more basic primitive but are specified.
The specification can be described as behaving that way:
  - A lock behaves as a read-modify-write. teh read behaving as a read-acquire
  - A unlock behaves as a store release.
  - Lock and Unlock operation (to a given lock variable)
    alternate in some total order. This order induces teh usal relations
    between accesses to a given location.

This of course strongly suggest implementing lock with a RWM (R being acquire,
ie amoswap.aq in RISCV)  and unlock as a store release
(ie amoswap.rl in RISCV). And again, this is too weak given LKMM
additional rule for RC. However, nothing prevents from a different
implemention provided it is safe.
As regards LKMM spinlocks, I am not sure that having strong
implementations of lock/unlock in Power (lwsync) and
ARMv8 (RCsc?) commands a specification stronger than the current one.


> 
> My understanding from earlier discussions is that ARM has no plans
> to use their own RCpc instruction for smp_load_acquire() instead
> of their RCsc instructions.  Is that still true?  If they were to
> use the RCpc load there, that would cause them to have the same
> problem we're discussing here, right?  Just checking.
> 
> Dan
