From: alankao@andestech.com (Alan Kao)
Date: Thu, 1 Nov 2018 17:00:15 +0800
Subject: About the Use of sfence.vma in Kernel
Message-ID: <20181101090015.GA6997@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi all,

As mentioned in the Privileged Spec about sfence.vma instruction:

> The supervisor memory-management fence instruction SFENCE.VMA is used
> to synchronize updates to in-memory memory-management data structures 
> with current execution.  Instruction execution causes implicit reads 
> and writes to these data structures;  however, these implicit references
> are ordinarily not ordered with respect to loads and stores in the instruction
> stream.
>
> Executing an SFENCE.VMA instruction guarantees that any stores in the
> instruction stream prior to the SFENCE.VMA are ordered before all implicit
> references subsequent to the SFENCE.VMA.

It naturally follows that we should use sfence.vma once the page table is
modified.  There are several examples in the kernel already, such as

alloc_set_pte (in mm/memory.c):
...
        set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
        /* no need to invalidate: a not-present page won't be cached */
        update_mmu_cache(vma, vmf->address, vmf->pte);
...
where the update_mmu_cache function eventually issues a sfence.vma.

I was interested if it is always the case and did some research.  RV64 uses
3-level of page table entry, pud, pmd and pte, so I traced a little bit about
the code flow after set_pud, set_pmd and set_pte.

It turns out that some of the calls to them are not followed by a
sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
later.

Are they bugs or I just misunderstand the instruction?  As the kernel has
already been stable for quite a while now, it is not likely to be a critical
bug.

Any clarification will highly appreciated.

Many thanks,
Alan Kao
