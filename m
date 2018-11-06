From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 05 Nov 2018 18:33:23 -0800 (PST)
Subject: [sw-dev] About the Use of sfence.vma in Kernel
In-Reply-To: <20181105004929.GA4735@andestech.com>
Message-ID: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Sorry, I missedy our original email.

On Sun, 04 Nov 2018 16:49:29 PST (-0800), alankao at andestech.com wrote:
> Hi Palmer,
>
> I believe the code in arch/riscv/mm/fault.c is mostly from you.
> Do you have any comments on this?
>
> On Thu, Nov 01, 2018 at 05:00:15PM +0800, Alan Kao wrote:
>> Hi all,
>>
>> As mentioned in the Privileged Spec about sfence.vma instruction:
>>
>> > The supervisor memory-management fence instruction SFENCE.VMA is used
>> > to synchronize updates to in-memory memory-management data structures
>> > with current execution.  Instruction execution causes implicit reads
>> > and writes to these data structures;  however, these implicit references
>> > are ordinarily not ordered with respect to loads and stores in the instruction
>> > stream.
>> >
>> > Executing an SFENCE.VMA instruction guarantees that any stores in the
>> > instruction stream prior to the SFENCE.VMA are ordered before all implicit
>> > references subsequent to the SFENCE.VMA.
>>
>> It naturally follows that we should use sfence.vma once the page table is
>> modified.  There are several examples in the kernel already, such as
>>
>> alloc_set_pte (in mm/memory.c):
>> ...
>>         set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>>         /* no need to invalidate: a not-present page won't be cached */
>>         update_mmu_cache(vma, vmf->address, vmf->pte);
>> ...
>> where the update_mmu_cache function eventually issues a sfence.vma.
>>
>> I was interested if it is always the case and did some research.  RV64 uses
>> 3-level of page table entry, pud, pmd and pte, so I traced a little bit about
>> the code flow after set_pud, set_pmd and set_pte.
>>
>> It turns out that some of the calls to them are not followed by a
>> sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
>> there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
>> later.

This specific one looks like a bug: we're trying to fill out the page table for 
the vmalloc region, but we'll just continue trapping without an "sfence.vma".  
The path between poking the page tables and the sret is pretty short and 
doesn't appear to ever have an "sfence.vma", so I'm not sure how this could 
work.

>>
>> Are they bugs or I just misunderstand the instruction?  As the kernel has
>> already been stable for quite a while now, it is not likely to be a critical
>> bug.
>>
>> Any clarification will highly appreciated.

Well, certainly from this it looks pretty broken -- and in a manner I'd expect 
to trigger frequently.  There are no fences in any of the other similar-looking 
implementations.

Maybe I'm missing something here?

FWIW, if I apply the following diff

    diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
    index 2a53d26ffdd6..fbd132d388fb 100644
    --- a/arch/riscv/kernel/reset.c
    +++ b/arch/riscv/kernel/reset.c
    @@ -15,6 +15,8 @@
     #include <linux/export.h>
     #include <asm/sbi.h>
    
    +extern long vmalloc_faults;
    +
     void (*pm_power_off)(void) = machine_power_off;
     EXPORT_SYMBOL(pm_power_off);
    
    @@ -31,6 +33,7 @@ void machine_halt(void)
    
     void machine_power_off(void)
     {
    +	printk("vmalloc faults: %ld\n", vmalloc_faults);
     	sbi_shutdown();
     	while (1);
     }
    diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
    index 88401d5125bc..61ef1128632c 100644
    --- a/arch/riscv/mm/fault.c
    +++ b/arch/riscv/mm/fault.c
    @@ -30,6 +30,8 @@
     #include <asm/pgalloc.h>
     #include <asm/ptrace.h>
    
    +long vmalloc_faults = 0;
    +
     /*
      * This routine handles page faults.  It determines the address and the
      * problem, and then passes it off to one of the appropriate routines.
    @@ -281,6 +283,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
     		pte_k = pte_offset_kernel(pmd_k, addr);
     		if (!pte_present(*pte_k))
     			goto no_context;
    +
    +		vmalloc_faults++;
     		return;
     	}
     }

I get only a single vmalloc fault when doing a boot+shutdown of Fedora in QEMU, 
so maybe this just slipped through the cracks?

>>
>> Many thanks,
>> Alan Kao
>>
>> --
>> You received this message because you are subscribed to the Google Groups "RISC-V SW Dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to sw-dev+unsubscribe at groups.riscv.org.
>> To post to this group, send email to sw-dev at groups.riscv.org.
>> Visit this group at https://groups.google.com/a/groups.riscv.org/group/sw-dev/.
>> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/sw-dev/20181101090015.GA6997%40andestech.com.
