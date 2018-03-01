From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 01 Mar 2018 13:54:29 -0800 (PST)
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <20180301151141.GA6430@andrea>
Message-ID: <mhng-82f403f2-fa94-4fdd-8770-3ee6f79a6752@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 01 Mar 2018 07:11:41 PST (-0800), parri.andrea at gmail.com wrote:
> Hi Daniel,
>
> On Thu, Feb 22, 2018 at 11:47:57AM -0800, Daniel Lustig wrote:
>> On 2/22/2018 10:27 AM, Peter Zijlstra wrote:
>> > On Thu, Feb 22, 2018 at 10:13:17AM -0800, Paul E. McKenney wrote:
>> >> So we have something that is not all that rare in the Linux kernel
>> >> community, namely two conflicting more-or-less concurrent changes.
>> >> This clearly needs to be resolved, either by us not strengthening the
>> >> Linux-kernel memory model in the way we were planning to or by you
>> >> strengthening RISC-V to be no weaker than PowerPC for these sorts of
>> >> externally viewed release-acquire situations.
>> >>
>> >> Other thoughts?
>> >
>> > Like said in the other email, I would _much_ prefer to not go weaker
>> > than PPC, I find that PPC is already painfully weak at times.
>>
>> Sure, and RISC-V could make this work too by using RCsc instructions
>> and/or by using lightweight fences instead.  It just wasn't clear at
>> first whether smp_load_acquire() and smp_store_release() were RCpc,
>> RCsc, or something else, and hence whether RISC-V would actually need
>> to use something stronger than pure RCpc there.  Likewise for
>> spin_unlock()/spin_lock() and everywhere else this comes up.
>
> while digging into riscv's locks and atomics to fix the issues discussed
> earlier in this thread, I became aware of another issue:
>
> Considering here the CMPXCHG primitives, for example, I noticed that the
> implementation currently provides the four variants
>
> 	ATOMIC_OPS(        , .aqrl)
> 	ATOMIC_OPS(_acquire,   .aq)
> 	ATOMIC_OPS(_release,   .rl)
> 	ATOMIC_OPS(_relaxed,      )
>
> (corresponding, resp., to
>
> 	atomic_cmpxchg()
> 	atomic_cmpxchg_acquire()
> 	atomic_cmpxchg_release()
> 	atomic_cmpxchg_relaxed()  )
>
> so that the first variant above ends up doing
>
> 	0:	lr.w.aqrl  %0, %addr
> 		bne        %0, %old, 1f
> 		sc.w.aqrl  %1, %new, %addr
> 		bnez       %1, 0b
>         1:
>
> From Sect. 2.3.5. ("Acquire/Release Ordering") of the Spec.,
>
>  "AMOs with both .aq and .rl set are fully-ordered operations.  Treating
>   the load part and the store part as independent RCsc operations is not
>   in and of itself sufficient to enforce full fencing behavior, but this
>   subtle weak behavior is counterintuitive and not much of an advantage
>   architecturally, especially with lr and sc also available [...]."
>
> I understand that
>
>         { x = y = u = v = 0 }
>
> 	P0()
>
> 	WRITE_ONCE(x, 1);		("relaxed" store, sw)
> 	atomic_cmpxchg(&u, 0, 1);
> 	r0 = READ_ONCE(y);		("relaxed" load, lw)
>
> 	P1()
>
> 	WRITE_ONCE(y, 1);
> 	atomic_cmpxchg(&v, 0, 1);
> 	r1 = READ_ONCE(x);
>
> could result in (u = v = 1 and r0 = r1 = 0) at the end; can you confirm?

cmpxchg isn't an AMO, it's an LR SC sequence, so that blurb doesn't apply.  I 
think "lr.w.aqrl" and "sc.w.aqrl" is not sufficient to perform a fully ordered 
operation (ie, it's an incorrect implementation of atomic_cmpxchg()), but I was 
hoping to get some time to actually internalize this part of the RISC-V memory 
model at some point to be sure.
