From: mick@ics.forth.gr (Nick Kossifidis)
Date: Tue, 06 Nov 2018 12:46:19 +0200
Subject: [sw-dev] About the Use of sfence.vma in Kernel
In-Reply-To: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
References: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
Message-ID: <e70484a0ac93bc3cff4865bb2772f8b5@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-06 04:33, Palmer Dabbelt ??????:
> Sorry, I missedy our original email.
> 
> On Sun, 04 Nov 2018 16:49:29 PST (-0800), alankao at andestech.com wrote:
>> Hi Palmer,
>> 
>> I believe the code in arch/riscv/mm/fault.c is mostly from you.
>> Do you have any comments on this?
>> 
>> On Thu, Nov 01, 2018 at 05:00:15PM +0800, Alan Kao wrote:
>>> Hi all,
>>> 
>>> As mentioned in the Privileged Spec about sfence.vma instruction:
>>> 
>>> > The supervisor memory-management fence instruction SFENCE.VMA is used
>>> > to synchronize updates to in-memory memory-management data structures
>>> > with current execution.  Instruction execution causes implicit reads
>>> > and writes to these data structures;  however, these implicit references
>>> > are ordinarily not ordered with respect to loads and stores in the instruction
>>> > stream.
>>> >
>>> > Executing an SFENCE.VMA instruction guarantees that any stores in the
>>> > instruction stream prior to the SFENCE.VMA are ordered before all implicit
>>> > references subsequent to the SFENCE.VMA.
>>> 
>>> It naturally follows that we should use sfence.vma once the page 
>>> table is
>>> modified.  There are several examples in the kernel already, such as
>>> 
>>> alloc_set_pte (in mm/memory.c):
>>> ...
>>>         set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>>>         /* no need to invalidate: a not-present page won't be cached 
>>> */
>>>         update_mmu_cache(vma, vmf->address, vmf->pte);
>>> ...
>>> where the update_mmu_cache function eventually issues a sfence.vma.
>>> 
>>> I was interested if it is always the case and did some research.  
>>> RV64 uses
>>> 3-level of page table entry, pud, pmd and pte, so I traced a little 
>>> bit about
>>> the code flow after set_pud, set_pmd and set_pte.
>>> 
>>> It turns out that some of the calls to them are not followed by a
>>> sfence.vma.  For an instance, in the vmalloc_fault region in 
>>> do_page_fault,
>>> there is no sfence.vma or calls to it after set_pgd, which directs to 
>>> set_pud
>>> later.
> 
> This specific one looks like a bug: we're trying to fill out the page
> table for the vmalloc region, but we'll just continue trapping without
> an "sfence.vma".  The path between poking the page tables and the sret
> is pretty short and doesn't appear to ever have an "sfence.vma", so
> I'm not sure how this could work.
> 
>>> 
>>> Are they bugs or I just misunderstand the instruction?  As the kernel 
>>> has
>>> already been stable for quite a while now, it is not likely to be a 
>>> critical
>>> bug.
>>> 
>>> Any clarification will highly appreciated.
> 
> Well, certainly from this it looks pretty broken -- and in a manner
> I'd expect to trigger frequently.  There are no fences in any of the
> other similar-looking implementations.
> 
> Maybe I'm missing something here?
> 

This is not something we can catch on QEMU and I think TileLink used on 
SiFive
boards can be coherent by design (TL-C) so maybe that's why you don't 
get any
failures.

BTW here is how arm does it on arm64 and I think their code is clean, 
instead of
sfence they use dsb, maybe we can get some idea on when we should fence.
https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/pgtable.h

However I have a question: If I get this right the weak memory model of 
RISC-V
allows us to do stuff on one core without having to notify the others, 
as long
as the code keeps running on the same core (it doesn't provide 
guarantees for
multi-core systems). Also when we have harts sharing the same cache we 
also
don't need to sfense, we also don't need to do it when caches are 
coherent
anyway and since cache coherency is implementation-specific maybe doing 
this for
everybody isn't the right approach. Sfence is expensive, it's done for 
the whole
memory and if we do it on every context switch it may introduce some 
unwanted
overhead.

Some ideas:

a) Have a function (maybe a function pointer on some 
platform/board-specific
struct, a relevant discussion here -> 
https://lkml.org/lkml/2018/10/31/431) that
implements sfence for this purpose if needed. If it's not needed it'll 
be a nop,
so chips that have coherent caches won't have to sfence on every page 
table update.

b) Use some feedback from the scheduler, for example if the process's 
cpu affinity
says that this process is pinned on a single core or that it's only 
scheduled on
cores that share their cache, we can again skip sfence.

Regards,
Nick
