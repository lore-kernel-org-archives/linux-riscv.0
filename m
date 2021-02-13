Return-Path: <SRS0=wGuT=HP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42CCC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Feb 2021 10:53:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51C164DA8
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Feb 2021 10:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51C164DA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QkL3Kj/bRzqPY1iJuXDPiplabTsBtTnE6uY1TX/PhTQ=; b=uxvPFwKdVy5cjbYyICjC+sh3M
	pJjBlGUOEjiiF+Cx6Jt3PGdpGIBelVbarylW9ROpxvODxQePQIaXGUZeXwz4Y7PsshK/AWZ4mFPAB
	iHmg4wI0xJwG88YRRVYCJuRWIomSRpdHyw9t4lNDMxbtvDPdnSm8Nh+KeUB07r5G9e9t0kyJxSPsM
	KuXtTn9/y5hHPp4fLgeG90FPoIgTAO4fgd36jOyfRD7LRmUI4+T3Qg2cZ2hY0jI0PESyV1vwZ9es7
	X3jpP1wMZwJEbJQ2YeKrkkMBaioodc4/eEIkC1gbedFDSRE2AqDNB7ynvnVMTANURY0k8Rk+bFYvr
	Y+PEQQQtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAsXi-0004zj-Oq; Sat, 13 Feb 2021 10:52:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAsXe-0004yg-8K
 for linux-riscv@lists.infradead.org; Sat, 13 Feb 2021 10:52:47 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CC2B9240007;
 Sat, 13 Feb 2021 10:52:36 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] riscv/kasan: add KASAN_VMALLOC support
From: Alex Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@dabbelt.com>, nylon7@andestech.com
References: <mhng-443fd141-b9a3-4be6-a056-416877f99ea4@palmerdabbelt-glaptop>
 <2b2f3038-3e27-8763-cf78-3fbbfd2100a0@ghiti.fr>
Message-ID: <4fa97788-157c-4059-ae3f-28ab074c5836@ghiti.fr>
Date: Sat, 13 Feb 2021 05:52:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2b2f3038-3e27-8763-cf78-3fbbfd2100a0@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_055246_513015_7CC33F17 
X-CRM114-Status: GOOD (  33.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, nylon7717@gmail.com,
 glider@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aryabinin@virtuozzo.com, linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Nylon, Palmer,

Le 2/8/21 =E0 1:28 AM, Alex Ghiti a =E9crit=A0:
> Hi Nylon,
> =

> Le 1/22/21 =E0 10:56 PM, Palmer Dabbelt a =E9crit=A0:
>> On Fri, 15 Jan 2021 21:58:35 PST (-0800), nylon7@andestech.com wrote:
>>> It references to x86/s390 architecture.
>>> >> So, it doesn't map the early shadow page to cover VMALLOC space.
>>>
>>> Prepopulate top level page table for the range that would otherwise be
>>> empty.
>>>
>>> lower levels are filled dynamically upon memory allocation while
>>> booting.
> =

> I think we can improve the changelog a bit here with something like that:
> =

> "KASAN vmalloc space used to be mapped using kasan early shadow page. =

> KASAN_VMALLOC requires the top-level of the kernel page table to be =

> properly populated, lower levels being filled dynamically upon memory =

> allocation at runtime."
> =

>>>
>>> Signed-off-by: Nylon Chen <nylon7@andestech.com>
>>> Signed-off-by: Nick Hu <nickhu@andestech.com>
>>> ---
>>> =A0arch/riscv/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
>>> =A0arch/riscv/mm/kasan_init.c | 57 ++++++++++++++++++++++++++++++++++++=
+-
>>> =A02 files changed, 57 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 81b76d44725d..15a2c8088bbe 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -57,6 +57,7 @@ config RISCV
>>> =A0=A0=A0=A0 select HAVE_ARCH_JUMP_LABEL
>>> =A0=A0=A0=A0 select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>> =A0=A0=A0=A0 select HAVE_ARCH_KASAN if MMU && 64BIT
>>> +=A0=A0=A0 select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>>> =A0=A0=A0=A0 select HAVE_ARCH_KGDB
>>> =A0=A0=A0=A0 select HAVE_ARCH_KGDB_QXFER_PKT
>>> =A0=A0=A0=A0 select HAVE_ARCH_MMAP_RND_BITS if MMU
>>> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>>> index 12ddd1f6bf70..4b9149f963d3 100644
>>> --- a/arch/riscv/mm/kasan_init.c
>>> +++ b/arch/riscv/mm/kasan_init.c
>>> @@ -9,6 +9,19 @@
>>> =A0#include <linux/pgtable.h>
>>> =A0#include <asm/tlbflush.h>
>>> =A0#include <asm/fixmap.h>
>>> +#include <asm/pgalloc.h>
>>> +
>>> +static __init void *early_alloc(size_t size, int node)
>>> +{
>>> +=A0=A0=A0 void *ptr =3D memblock_alloc_try_nid(size, size,
>>> +=A0=A0=A0=A0=A0=A0=A0 __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE=
, node);
>>> +
>>> +=A0=A0=A0 if (!ptr)
>>> +=A0=A0=A0=A0=A0=A0=A0 panic("%pS: Failed to allocate %zu bytes align=
=3D%zx nid=3D%d =

>>> from=3D%llx\n",
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __func__, size, size, node, (u64)__p=
a(MAX_DMA_ADDRESS));
>>> +
>>> +=A0=A0=A0 return ptr;
>>> +}
>>>
>>> =A0extern pgd_t early_pg_dir[PTRS_PER_PGD];
>>> =A0asmlinkage void __init kasan_early_init(void)
>>> @@ -83,6 +96,40 @@ static void __init populate(void *start, void *end)
>>> =A0=A0=A0=A0 memset(start, 0, end - start);
>>> =A0}
>>>
>>> +void __init kasan_shallow_populate(void *start, void *end)
>>> +{
>>> +=A0=A0=A0 unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
>>> +=A0=A0=A0 unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
>>> +=A0=A0=A0 unsigned long pfn;
>>> +=A0=A0=A0 int index;
>>> +=A0=A0=A0 void *p;
>>> +=A0=A0=A0 pud_t *pud_dir, *pud_k;
>>> +=A0=A0=A0 pgd_t *pgd_dir, *pgd_k;
>>> +=A0=A0=A0 p4d_t *p4d_dir, *p4d_k;
>>> +
>>> +=A0=A0=A0 while (vaddr < vend) {
>>> +=A0=A0=A0=A0=A0=A0=A0 index =3D pgd_index(vaddr);
>>> +=A0=A0=A0=A0=A0=A0=A0 pfn =3D csr_read(CSR_SATP) & SATP_PPN;
> =

> At this point in the boot process, we know that we use swapper_pg_dir so =

> no need to read SATP.
> =

>>> +=A0=A0=A0=A0=A0=A0=A0 pgd_dir =3D (pgd_t *)pfn_to_virt(pfn) + index;
> =

> Here, this pgd_dir assignment is overwritten 2 lines below, so no need =

> for it.
> =

>>> +=A0=A0=A0=A0=A0=A0=A0 pgd_k =3D init_mm.pgd + index;
>>> +=A0=A0=A0=A0=A0=A0=A0 pgd_dir =3D pgd_offset_k(vaddr);
> =

> pgd_offset_k(vaddr) =3D init_mm.pgd + pgd_index(vaddr) so pgd_k =3D=3D pg=
d_dir.
> =

>>> +=A0=A0=A0=A0=A0=A0=A0 set_pgd(pgd_dir, *pgd_k);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 p4d_dir =3D p4d_offset(pgd_dir, vaddr);
>>> +=A0=A0=A0=A0=A0=A0=A0 p4d_k=A0 =3D p4d_offset(pgd_k, vaddr);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 vaddr =3D (vaddr + PUD_SIZE) & PUD_MASK;
> =

> Why do you increase vaddr *before* populating the first one ? And =

> pud_addr_end does that properly: it returns the next pud address if it =

> does not go beyond end address to map.
> =

>>> +=A0=A0=A0=A0=A0=A0=A0 pud_dir =3D pud_offset(p4d_dir, vaddr);
>>> +=A0=A0=A0=A0=A0=A0=A0 pud_k =3D pud_offset(p4d_k, vaddr);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 if (pud_present(*pud_dir)) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p =3D early_alloc(PAGE_SIZE, NUMA_NO=
_NODE);
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pud_populate(&init_mm, pud_dir, p);
> =

> init_mm is not needed here.
> =

>>> +=A0=A0=A0=A0=A0=A0=A0 }
>>> +=A0=A0=A0=A0=A0=A0=A0 vaddr +=3D PAGE_SIZE;
> =

> Why do you need to add PAGE_SIZE ? vaddr already points to the next pud.
> =

> It seems like this patch tries to populate userspace page table whereas =

> at this point in the boot process, only swapper_pg_dir is used or am I =

> missing something ?
> =

> Thanks,
> =

> Alex

I implemented this morning a version that fixes all the comments I made =

earlier. I was able to insert test_kasan_module on both sv39 and sv48 =

without any modification: set_pgd "goes through" all the unused page =

table levels, whereas p*d_populate are noop for unused levels.

If you have any comment, do not hesitate.

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c =


index adbf94b7e68a..d643b222167c 100644 =


--- a/arch/riscv/mm/kasan_init.c =


+++ b/arch/riscv/mm/kasan_init.c =


@@ -195,6 +195,31 @@ static void __init kasan_populate(void *start, void =

*end)
         memset(start, KASAN_SHADOW_INIT, end - start); =


  } =


 =


+void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsigned =

long end)
+{ =


+       unsigned long next; =


+       void *p; =


+       pgd_t *pgd_k =3D pgd_offset_k(vaddr); =


+ =


+       do { =


+               next =3D pgd_addr_end(vaddr, end); =


+               if (pgd_page_vaddr(*pgd_k) =3D=3D (unsigned =

long)lm_alias(kasan_early_shadow_pgd_next)) {
+                       p =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE); =


+                       set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), =

PAGE_TABLE));
+               } =


+       } while (pgd_k++, vaddr =3D next, vaddr !=3D end); =


+} =


+ =


+void __init kasan_shallow_populate(void *start, void *end) =


+{ =


+       unsigned long vaddr =3D (unsigned long)start & PAGE_MASK; =


+       unsigned long vend =3D PAGE_ALIGN((unsigned long)end); =


+ =


+       kasan_shallow_populate_pgd(vaddr, vend); =


+ =


+       local_flush_tlb_all(); =


+} =


+ =


  void __init kasan_init(void) =


  { =


         phys_addr_t _start, _end; =


@@ -206,7 +231,15 @@ void __init kasan_init(void) =


          */ =


         kasan_populate_early_shadow((void *)KASAN_SHADOW_START, =


                                     (void *)kasan_mem_to_shadow((void =

*)
- =

VMALLOC_END));
+ =

VMEMMAP_END));
+       if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) =


+               kasan_shallow_populate( =


+                       (void *)kasan_mem_to_shadow((void =

*)VMALLOC_START),
+                       (void *)kasan_mem_to_shadow((void =

*)VMALLOC_END));
+       else =


+               kasan_populate_early_shadow( =


+                       (void *)kasan_mem_to_shadow((void =

*)VMALLOC_START),
+                       (void *)kasan_mem_to_shadow((void =

*)VMALLOC_END));
 =


         /* Populate the linear mapping */ =


         for_each_mem_range(i, &_start, &_end) { =


-- =


2.20.1

Thanks,

Alex

> =

>>> +=A0=A0=A0 }
>>> +}
>>> +
>>> =A0void __init kasan_init(void)
>>> =A0{
>>> =A0=A0=A0=A0 phys_addr_t _start, _end;
>>> @@ -90,7 +137,15 @@ void __init kasan_init(void)
>>>
>>> =A0=A0=A0=A0 kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (void *)ka=
san_mem_to_shadow((void *)
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 VMALLOC_END));
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 VMEMMAP_END));
>>> +=A0=A0=A0 if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
>>> +=A0=A0=A0=A0=A0=A0=A0 kasan_shallow_populate(
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (void *)kasan_mem_to_shadow((void *)=
VMALLOC_START),
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (void *)kasan_mem_to_shadow((void *)=
VMALLOC_END));
>>> +=A0=A0=A0 else
>>> +=A0=A0=A0=A0=A0=A0=A0 kasan_populate_early_shadow(
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (void *)kasan_mem_to_shadow((void *)=
VMALLOC_START),
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (void *)kasan_mem_to_shadow((void *)=
VMALLOC_END));
>>>
>>> =A0=A0=A0=A0 for_each_mem_range(i, &_start, &_end) {
>>> =A0=A0=A0=A0=A0=A0=A0=A0 void *start =3D (void *)_start; >
>> Thanks, this is on for-next.
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
