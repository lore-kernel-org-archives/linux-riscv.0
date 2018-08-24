From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 24 Aug 2018 07:06:51 -0700
Subject: [RFC PATCH 2/2] mm: mmu_notifier fix for tlb_end_vma (build
 failures)
In-Reply-To: <20180824135048.GF11868@brain-police>
References: <20180823084709.19717-1-npiggin@gmail.com>
 <20180823084709.19717-3-npiggin@gmail.com>
 <20180824130722.GA31409@roeck-us.net> <20180824131026.GB11868@brain-police>
 <20180824132419.GA9983@roeck-us.net> <20180824133427.GC11868@brain-police>
 <20180824135048.GF11868@brain-police>
Message-ID: <7d0111f4-c369-43a8-72c6-1a7390cdebdd@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 08/24/2018 06:50 AM, Will Deacon wrote:

>> -#include <asm-generic/tlb.h>
>> +struct mmu_gather;
>>   
>>   static inline void tlb_flush(struct mmu_gather *tlb)
>>   {
>>   	flush_tlb_mm(tlb->mm);
> 
> Bah, didn't spot the dereference so this won't work either. You basically
> just need to copy what I did for arm64 in d475fac95779.
> 

Yes, this seems to work. It doesn't really need "struct mmu_gather;" -
I assume that is included from elsewhere - but I added it to be safe.

Can you send a full patch, or do you want me to do it ?

Thanks,
Guenter

---
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index c229509288ea..439dc7072e05 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -14,6 +14,10 @@
  #ifndef _ASM_RISCV_TLB_H
  #define _ASM_RISCV_TLB_H

+struct mmu_gather;
+
+static void tlb_flush(struct mmu_gather *tlb);
+
  #include <asm-generic/tlb.h>

  static inline void tlb_flush(struct mmu_gather *tlb)
