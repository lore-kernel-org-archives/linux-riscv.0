Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20033C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 19:19:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B601A64FAE
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 19:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B601A64FAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F82KC/SCXP5uHKc0r4CdO1Y+zqBLHMC1oNbU2OtL6W8=; b=jc5AQkENbfmuxh1qosSOM2g8M
	7RFeMqsaJHLw40hWFTQkancn9KOO8Jd2ci5wD0of+vOxankCyaT9yQlnONP5B7qC3xUOmZkvJ5/35
	gIZoxJqnx0h/0FtFXi13obD/nf4m19yMU3TsnSNm1q6CTZckzTuwAfOjcd2MzWqSh/rBwC+cUr0II
	KTDdc2T791V3qHQlUzWt/O66d229E3BcXDD3dkYQRTgwHkXHSmHyixwsDaWv5iNf8ed9OZB1GQ+/a
	KlJoJ+li0+Pesf3CBQyVEpPqsWrqHHm9cZ9m9mAuBi95neJkvsxkThOP4QTDLwYS+XaMz8o7jfNME
	NonkfA96w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK4MK-007b5y-GL; Wed, 10 Mar 2021 19:19:04 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK4MD-007b4N-R3
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 19:19:01 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6273DFF803;
 Wed, 10 Mar 2021 19:18:52 +0000 (UTC)
Subject: Re: [PATCH v2] riscv: Improve KASAN_VMALLOC support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 nylon7@andestech.com, nickhu@andestech.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
References: <mhng-a1ab9e7a-d992-4432-badc-02cc788b1ace@penguin>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <7db28eaf-f556-8ca5-e6b9-b932d4e786e2@ghiti.fr>
Date: Wed, 10 Mar 2021 14:18:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <mhng-a1ab9e7a-d992-4432-badc-02cc788b1ace@penguin>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_191857_994435_C0CD5E20 
X-CRM114-Status: GOOD (  32.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 3/9/21 =E0 9:37 PM, Palmer Dabbelt a =E9crit=A0:
> On Fri, 26 Feb 2021 10:01:54 PST (-0800), alex@ghiti.fr wrote:
>> When KASAN vmalloc region is populated, there is no userspace process and
>> the page table in use is swapper_pg_dir, so there is no need to read
>> SATP. Then we can use the same scheme used by kasan_populate_p*d
>> functions to go through the page table, which harmonizes the code.
>>
>> In addition, make use of set_pgd that goes through all unused page table
>> levels, contrary to p*d_populate functions, which makes this function =

>> work
>> whatever the number of page table levels.
>>
>> And finally, make sure the writes to swapper_pg_dir are visible using
>> an sfence.vma.
> =

> So I think this is actually a bug: without the fence we could get a =

> kasan-related fault at any point (as the mappings might not be visible =

> yet), and if we get one when inside do_page_fault() (or while holding a =

> lock it wants) we'll end up deadlocking against ourselves.=A0 That'll =

> probably never happen in practice, but it'd still be good to get the =

> fence onto fixes. The rest are cleanups, they're for for-next (and =

> should probably be part of your sv48 series, if you need to re-spin it =

> -- I'll look at that next).

I only talked about sv48 support in the changelog as it explains why I =

replaced p*d_populate functions for set_p*d, this is not directly linked =

to the sv48 patchset, this is just a bonus that it works for both :)

> =

> LMK if you want to split this up, or if you want me to do it.=A0 Either w=
ay,

I'll split it up: one patch for the cleanup and one patch for the fix.

> =

> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks,

Alex

> =

> Thanks!
> =

>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>
>> Changes in v2:
>> - Quiet kernel test robot warnings about missing prototypes by declaring
>> =A0 the introduced functions as static.
>>
>> =A0arch/riscv/mm/kasan_init.c | 61 +++++++++++++-------------------------
>> =A01 file changed, 20 insertions(+), 41 deletions(-)
>>
>> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> index e3d91f334b57..aaa3bdc0ffc0 100644
>> --- a/arch/riscv/mm/kasan_init.c
>> +++ b/arch/riscv/mm/kasan_init.c
>> @@ -11,18 +11,6 @@
>> =A0#include <asm/fixmap.h>
>> =A0#include <asm/pgalloc.h>
>>
>> -static __init void *early_alloc(size_t size, int node)
>> -{
>> -=A0=A0=A0 void *ptr =3D memblock_alloc_try_nid(size, size,
>> -=A0=A0=A0=A0=A0=A0=A0 __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE,=
 node);
>> -
>> -=A0=A0=A0 if (!ptr)
>> -=A0=A0=A0=A0=A0=A0=A0 panic("%pS: Failed to allocate %zu bytes align=3D=
%zx nid=3D%d =

>> from=3D%llx\n",
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __func__, size, size, node, (u64)__pa=
(MAX_DMA_ADDRESS));
>> -
>> -=A0=A0=A0 return ptr;
>> -}
>> -
>> =A0extern pgd_t early_pg_dir[PTRS_PER_PGD];
>> =A0asmlinkage void __init kasan_early_init(void)
>> =A0{
>> @@ -155,38 +143,29 @@ static void __init kasan_populate(void *start, =

>> void *end)
>> =A0=A0=A0=A0 memset(start, KASAN_SHADOW_INIT, end - start);
>> =A0}
>>
>> -void __init kasan_shallow_populate(void *start, void *end)
>> +static void __init kasan_shallow_populate_pgd(unsigned long vaddr, =

>> unsigned long end)
>> =A0{
>> -=A0=A0=A0 unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
>> -=A0=A0=A0 unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
>> -=A0=A0=A0 unsigned long pfn;
>> -=A0=A0=A0 int index;
>> +=A0=A0=A0 unsigned long next;
>> =A0=A0=A0=A0 void *p;
>> -=A0=A0=A0 pud_t *pud_dir, *pud_k;
>> -=A0=A0=A0 pgd_t *pgd_dir, *pgd_k;
>> -=A0=A0=A0 p4d_t *p4d_dir, *p4d_k;
>> -
>> -=A0=A0=A0 while (vaddr < vend) {
>> -=A0=A0=A0=A0=A0=A0=A0 index =3D pgd_index(vaddr);
>> -=A0=A0=A0=A0=A0=A0=A0 pfn =3D csr_read(CSR_SATP) & SATP_PPN;
>> -=A0=A0=A0=A0=A0=A0=A0 pgd_dir =3D (pgd_t *)pfn_to_virt(pfn) + index;
>> -=A0=A0=A0=A0=A0=A0=A0 pgd_k =3D init_mm.pgd + index;
>> -=A0=A0=A0=A0=A0=A0=A0 pgd_dir =3D pgd_offset_k(vaddr);
>> -=A0=A0=A0=A0=A0=A0=A0 set_pgd(pgd_dir, *pgd_k);
>> -
>> -=A0=A0=A0=A0=A0=A0=A0 p4d_dir =3D p4d_offset(pgd_dir, vaddr);
>> -=A0=A0=A0=A0=A0=A0=A0 p4d_k=A0 =3D p4d_offset(pgd_k, vaddr);
>> -
>> -=A0=A0=A0=A0=A0=A0=A0 vaddr =3D (vaddr + PUD_SIZE) & PUD_MASK;
>> -=A0=A0=A0=A0=A0=A0=A0 pud_dir =3D pud_offset(p4d_dir, vaddr);
>> -=A0=A0=A0=A0=A0=A0=A0 pud_k =3D pud_offset(p4d_k, vaddr);
>> -
>> -=A0=A0=A0=A0=A0=A0=A0 if (pud_present(*pud_dir)) {
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p =3D early_alloc(PAGE_SIZE, NUMA_NO_=
NODE);
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pud_populate(&init_mm, pud_dir, p);
>> +=A0=A0=A0 pgd_t *pgd_k =3D pgd_offset_k(vaddr);
>> +
>> +=A0=A0=A0 do {
>> +=A0=A0=A0=A0=A0=A0=A0 next =3D pgd_addr_end(vaddr, end);
>> +=A0=A0=A0=A0=A0=A0=A0 if (pgd_page_vaddr(*pgd_k) =3D=3D (unsigned =

>> long)lm_alias(kasan_early_shadow_pmd)) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p =3D memblock_alloc(PAGE_SIZE, PAGE_=
SIZE);
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(=
p)), PAGE_TABLE));
>> =A0=A0=A0=A0=A0=A0=A0=A0 }
>> -=A0=A0=A0=A0=A0=A0=A0 vaddr +=3D PAGE_SIZE;
>> -=A0=A0=A0 }
>> +=A0=A0=A0 } while (pgd_k++, vaddr =3D next, vaddr !=3D end);
>> +}
>> +
>> +static void __init kasan_shallow_populate(void *start, void *end)
>> +{
>> +=A0=A0=A0 unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
>> +=A0=A0=A0 unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
>> +
>> +=A0=A0=A0 kasan_shallow_populate_pgd(vaddr, vend);
>> +
>> +=A0=A0=A0 local_flush_tlb_all();
>> =A0}
>>
>> =A0void __init kasan_init(void)
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
