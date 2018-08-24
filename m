From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 24 Aug 2018 11:22:59 -0700
Subject: [RFC PATCH 2/2] mm: mmu_notifier fix for tlb_end_vma (build
 failures)
In-Reply-To: <20180824142532.GG11868@brain-police>
References: <20180823084709.19717-1-npiggin@gmail.com>
 <20180823084709.19717-3-npiggin@gmail.com>
 <20180824130722.GA31409@roeck-us.net>
 <20180824131026.GB11868@brain-police>
 <20180824132419.GA9983@roeck-us.net>
 <20180824133427.GC11868@brain-police>
 <20180824135048.GF11868@brain-police>
 <7d0111f4-c369-43a8-72c6-1a7390cdebdd@roeck-us.net>
 <20180824142532.GG11868@brain-police>
Message-ID: <20180824182259.GA18477@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Aug 24, 2018 at 03:25:33PM +0100, Will Deacon wrote:
> On Fri, Aug 24, 2018 at 07:06:51AM -0700, Guenter Roeck wrote:
> > On 08/24/2018 06:50 AM, Will Deacon wrote:
> > 
> > >>-#include <asm-generic/tlb.h>
> > >>+struct mmu_gather;
> > >>  static inline void tlb_flush(struct mmu_gather *tlb)
> > >>  {
> > >>  	flush_tlb_mm(tlb->mm);
> > >
> > >Bah, didn't spot the dereference so this won't work either. You basically
> > >just need to copy what I did for arm64 in d475fac95779.
> > >
> > 
> > Yes, this seems to work. It doesn't really need "struct mmu_gather;" -
> > I assume that is included from elsewhere - but I added it to be safe.
> 
> struct mmu_gather comes in via asm-generic/tlb.h.
> 
>From linux/mm.h, really, which happens to be included before
asm/tlb.h is included (see arch/riscv/include/asm/pgalloc.h).
I kept it to be future-proof.

> > Can you send a full patch, or do you want me to do it ?
> 
> I'm evidently incapable of writing code today, so please go ahead :)
> 
Done. We'll see if I am any better.

Guenter
