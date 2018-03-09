From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 09 Mar 2018 14:57:59 -0800 (PST)
Subject: [PATCH v2 2/2] riscv/atomic: Strengthen implementations with
 fences
In-Reply-To: <20180309213008.GA3154@andrea>
Message-ID: <mhng-a5cc1e9d-00d5-49e7-8acd-173277f28381@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 09 Mar 2018 13:30:08 PST (-0800), parri.andrea at gmail.com wrote:
> On Fri, Mar 09, 2018 at 10:54:27AM -0800, Palmer Dabbelt wrote:
>> On Fri, 09 Mar 2018 10:36:44 PST (-0800), parri.andrea at gmail.com wrote:
>
> [...]
>
>
>> >This belongs to the "few style fixes" (in the specific, 80-chars lines)
>> >mentioned in the cover letter; I could not resist ;-), but I'll remove
>> >them in v3 if you like so.
>>
>> No problem, just next time it's a bit easier to not mix the really complicated
>> stuff (memory model changes) with the really simple stuff (whitespace changes).
>
> Got it.
>
>
>> >This proposal relies on the generic definition,
>> >
>> >   include/linux/atomic.h ,
>> >
>> >and on the
>> >
>> >   __atomic_op_acquire()
>> >   __atomic_op_release()
>> >
>> >above to build the acquire/release atomics (except for the xchg,cmpxchg,
>> >where the ACQUIRE_BARRIER is inserted conditionally/on success).
>>
>> I thought we wanted to use the AQ and RL bits for AMOs, just not for LR/SC
>> sequences.  IIRC the AMOs are safe with the current memory model, but I might
>> just have some version mismatches in my head.
>
> AMO.aqrl are "safe" w.r.t. the LKMM (as they provide "full-ordering"); OTOH,
> AMO.aq and AMO.rl present weaknesses that LKMM (and some kernel developers)
> do not "expect".  I was probing this issue in:
>
>   https://marc.info/?l=linux-kernel&m=151930201102853&w=2
>
> (c.f., e.g., test "RISCV-unlock-lock-read-ordering" from that post).
>
> Quoting from the commit message of my patch 1/2:
>
>   "Referring to the "unlock-lock-read-ordering" test reported below,
>    Daniel wrote:
>
>      I think an RCpc interpretation of .aq and .rl would in fact
>      allow the two normal loads in P1 to be reordered [...]
>
>      [...]
>
>      Likewise even if the unlock()/lock() is between two stores.
>      A control dependency might originate from the load part of
>      the amoswap.w.aq, but there still would have to be something
>      to ensure that this load part in fact performs after the store
>      part of the amoswap.w.rl performs globally, and that's not
>      automatic under RCpc.
>
>    Simulation of the RISC-V memory consistency model confirmed this
>    expectation."
>
> I have just (re)checked these observations against the latest specification,
> and my results _confirmed_ these verdicts.

Thanks, I must have just gotten confused about a draft spec or something.  I'm
pulling these on top or your other memory model related patch.  I've renamed
the branch "next-mm" to be a bit more descriptiove.

Thanks!
