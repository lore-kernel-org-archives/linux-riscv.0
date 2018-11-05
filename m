From: alankao@andestech.com (Alan Kao)
Date: Mon, 5 Nov 2018 08:49:29 +0800
Subject: [sw-dev] About the Use of sfence.vma in Kernel
In-Reply-To: <20181101090015.GA6997@andestech.com>
References: <20181101090015.GA6997@andestech.com>
Message-ID: <20181105004929.GA4735@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

I believe the code in arch/riscv/mm/fault.c is mostly from you.
Do you have any comments on this?

On Thu, Nov 01, 2018 at 05:00:15PM +0800, Alan Kao wrote:
> Hi all,
> 
> As mentioned in the Privileged Spec about sfence.vma instruction:
> 
> > The supervisor memory-management fence instruction SFENCE.VMA is used
> > to synchronize updates to in-memory memory-management data structures 
> > with current execution.  Instruction execution causes implicit reads 
> > and writes to these data structures;  however, these implicit references
> > are ordinarily not ordered with respect to loads and stores in the instruction
> > stream.
> >
> > Executing an SFENCE.VMA instruction guarantees that any stores in the
> > instruction stream prior to the SFENCE.VMA are ordered before all implicit
> > references subsequent to the SFENCE.VMA.
> 
> It naturally follows that we should use sfence.vma once the page table is
> modified.  There are several examples in the kernel already, such as
> 
> alloc_set_pte (in mm/memory.c):
> ...
>         set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>         /* no need to invalidate: a not-present page won't be cached */
>         update_mmu_cache(vma, vmf->address, vmf->pte);
> ...
> where the update_mmu_cache function eventually issues a sfence.vma.
> 
> I was interested if it is always the case and did some research.  RV64 uses
> 3-level of page table entry, pud, pmd and pte, so I traced a little bit about
> the code flow after set_pud, set_pmd and set_pte.
> 
> It turns out that some of the calls to them are not followed by a
> sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
> there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
> later.
> 
> Are they bugs or I just misunderstand the instruction?  As the kernel has
> already been stable for quite a while now, it is not likely to be a critical
> bug.
> 
> Any clarification will highly appreciated.
> 
> Many thanks,
> Alan Kao
> 
> -- 
> You received this message because you are subscribed to the Google Groups "RISC-V SW Dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to sw-dev+unsubscribe at groups.riscv.org.
> To post to this group, send email to sw-dev at groups.riscv.org.
> Visit this group at https://groups.google.com/a/groups.riscv.org/group/sw-dev/.
> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/sw-dev/20181101090015.GA6997%40andestech.com.
