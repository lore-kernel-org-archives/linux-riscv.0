From: dlustig@nvidia.com (Daniel Lustig)
Date: Thu, 22 Feb 2018 11:47:57 -0800
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <20180222182717.GS25181@hirez.programming.kicks-ass.net>
References: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
 <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
 <20180222182717.GS25181@hirez.programming.kicks-ass.net>
Message-ID: <563431d0-4fb5-9efd-c393-83cc5197e934@nvidia.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 2/22/2018 10:27 AM, Peter Zijlstra wrote:
> On Thu, Feb 22, 2018 at 10:13:17AM -0800, Paul E. McKenney wrote:
>> So we have something that is not all that rare in the Linux kernel
>> community, namely two conflicting more-or-less concurrent changes.
>> This clearly needs to be resolved, either by us not strengthening the
>> Linux-kernel memory model in the way we were planning to or by you
>> strengthening RISC-V to be no weaker than PowerPC for these sorts of
>> externally viewed release-acquire situations.
>>
>> Other thoughts?
> 
> Like said in the other email, I would _much_ prefer to not go weaker
> than PPC, I find that PPC is already painfully weak at times.

Sure, and RISC-V could make this work too by using RCsc instructions
and/or by using lightweight fences instead.  It just wasn't clear at
first whether smp_load_acquire() and smp_store_release() were RCpc,
RCsc, or something else, and hence whether RISC-V would actually need
to use something stronger than pure RCpc there.  Likewise for
spin_unlock()/spin_lock() and everywhere else this comes up.

As Paul's email in the other thread observed, RCpc seems to be
OK for smp_load_acquire()/smp_store_release() at least according
to the current LKMM herd spec.  Unlock/lock are stronger already
I guess.  But if there's an active proposal to strengthen them all
to something stricter than pure RCpc, then that's good to know.

My understanding from earlier discussions is that ARM has no plans
to use their own RCpc instruction for smp_load_acquire() instead
of their RCsc instructions.  Is that still true?  If they were to
use the RCpc load there, that would cause them to have the same
problem we're discussing here, right?  Just checking.

Dan
