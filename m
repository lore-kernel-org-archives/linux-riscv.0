From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 24 Aug 2018 06:07:22 -0700
Subject: [RFC PATCH 2/2] mm: mmu_notifier fix for tlb_end_vma (build
 failures)
In-Reply-To: <20180823084709.19717-3-npiggin@gmail.com>
References: <20180823084709.19717-1-npiggin@gmail.com>
 <20180823084709.19717-3-npiggin@gmail.com>
Message-ID: <20180824130722.GA31409@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 23, 2018 at 06:47:09PM +1000, Nicholas Piggin wrote:
> The generic tlb_end_vma does not call invalidate_range mmu notifier,
> and it resets resets the mmu_gather range, which means the notifier
> won't be called on part of the range in case of an unmap that spans
> multiple vmas.
> 
> ARM64 seems to be the only arch I could see that has notifiers and
> uses the generic tlb_end_vma. I have not actually tested it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Acked-by: Will Deacon <will.deacon@arm.com>

This patch breaks riscv builds in mainline.

Building riscv:defconfig ... failed
--------------
Error log:
In file included from riscv/include/asm/tlb.h:17:0,
                 from arch/riscv/include/asm/pgalloc.h:19,
                 from riscv/mm/fault.c:30:
include/asm-generic/tlb.h: In function 'tlb_flush_mmu_tlbonly':
include/asm-generic/tlb.h:147:2: error: implicit declaration of function 'tlb_flush'

In file included from arch/riscv/include/asm/pgalloc.h:19:0,
		from arch/riscv/mm/fault.c:30:
arch/riscv/include/asm/tlb.h: At top level:
arch/riscv/include/asm/tlb.h:19:20: warning: conflicting types for 'tlb_flush'

Guenter
