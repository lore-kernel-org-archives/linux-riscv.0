Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38071C43381
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:46:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B15D64E92
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B15D64E92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A+/OvaBIaAQK80EypAapx2EPuRJIPTn4j9d7yu1JyiE=; b=K6sT0EOR8dNy9ywPtyQCF5yZw
	2Zv4MDv7p9IigfoCHRgDgeA55mfHuLDTqGggxql2cazflABnfAYPGAIVOcQFaxaaM3V4yeeBInRuW
	YoJeoWTZzNHcn10HFeNoJGdZRdwWGhdyTH+Fm72A0Psss9UtdkybhecLPPoNalrtjBN80q5PQatXn
	OyEx4vvi9lcAOWRUI9dYBBd/QioubG4e3PCah5bsyMzga1S2gxTF5tn9Km831Fq9v2sNUUCbLmI7m
	xLEhRlq5RGf8dvZ5yQpja0+HGfvjU+LBoUEvhcMGw0ZTQgmqXXuX/bWzA0BqMI963t3FDF6YWUw4K
	ssik2W18w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9CUb-0000C7-Py; Mon, 08 Feb 2021 19:46:42 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9CUX-0000BO-Vf
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 19:46:39 +0000
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 815F5200002;
 Mon,  8 Feb 2021 19:46:34 +0000 (UTC)
Subject: Re: [PATCH] riscv: Improve kasan population by using hugepages when
 possible
From: Alex Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210201080024.844-1-alex@ghiti.fr>
 <74fef5c9-0632-3e12-e11b-81dd115a4be5@ghiti.fr>
Message-ID: <249567fd-d436-7e06-081c-65b1f9930b07@ghiti.fr>
Date: Mon, 8 Feb 2021 14:46:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <74fef5c9-0632-3e12-e11b-81dd115a4be5@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_144638_241405_E5FB9926 
X-CRM114-Status: GOOD (  25.11  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 2/2/21 =E0 3:50 AM, Alex Ghiti a =E9crit=A0:
> Hi,
> =

> Le 2/1/21 =E0 3:00 AM, Alexandre Ghiti a =E9crit=A0:
>> Kasan function that populates the shadow regions used to allocate them
>> page by page and did not take advantage of hugepages, so fix this by
>> trying to allocate hugepages of 1GB and fallback to 2MB hugepages or 4K
>> pages in case it fails.
>>
>> This reduces the page table memory consumption and improves TLB usage,
>> as shown below:
>>
>> Before this patch:
>>
>> ---[ Kasan shadow start ]---
>> 0xffffffc000000000-0xffffffc400000000=A0=A0=A0 0x00000000818ef000=A0=A0=
=A0=A0=A0=A0=A0 16G =

>> PTE=A0=A0=A0=A0 . A . . . . R V
>> 0xffffffc400000000-0xffffffc447fc0000=A0=A0=A0 0x00000002b7f4f000=A0=A0 =
1179392K =

>> PTE=A0=A0=A0=A0 D A . . . W R V
>> 0xffffffc480000000-0xffffffc800000000=A0=A0=A0 0x00000000818ef000=A0=A0=
=A0=A0=A0=A0=A0 14G =

>> PTE=A0=A0=A0=A0 . A . . . . R V
>> ---[ Kasan shadow end ]---
>>
>> After this patch:
>>
>> ---[ Kasan shadow start ]---
>> 0xffffffc000000000-0xffffffc400000000=A0=A0=A0 0x00000000818ef000=A0=A0=
=A0=A0=A0=A0=A0 16G =

>> PTE=A0=A0=A0=A0 . A . . . . R V
>> 0xffffffc400000000-0xffffffc440000000=A0=A0=A0 0x0000000240000000=A0=A0=
=A0=A0=A0=A0=A0=A0 1G =

>> PGD=A0=A0=A0=A0 D A . . . W R V
>> 0xffffffc440000000-0xffffffc447e00000=A0=A0=A0 0x00000002b7e00000=A0=A0=
=A0=A0=A0=A0 126M =

>> PMD=A0=A0=A0=A0 D A . . . W R V
>> 0xffffffc447e00000-0xffffffc447fc0000=A0=A0=A0 0x00000002b818f000=A0=A0=
=A0=A0=A0 1792K =

>> PTE=A0=A0=A0=A0 D A . . . W R V
>> 0xffffffc480000000-0xffffffc800000000=A0=A0=A0 0x00000000818ef000=A0=A0=
=A0=A0=A0=A0=A0 14G =

>> PTE=A0=A0=A0=A0 . A . . . . R V
>> ---[ Kasan shadow end ]---
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>> =A0 arch/riscv/mm/kasan_init.c | 101 +++++++++++++++++++++++++++--------=
--
>> =A0 1 file changed, 73 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> index a8a2ffd9114a..8f11b73018b1 100644
>> --- a/arch/riscv/mm/kasan_init.c
>> +++ b/arch/riscv/mm/kasan_init.c
>> @@ -47,37 +47,82 @@ asmlinkage void __init kasan_early_init(void)
>> =A0=A0=A0=A0=A0 local_flush_tlb_all();
>> =A0 }
>> -static void __init populate(void *start, void *end)
>> +static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, =

>> unsigned long end)
>> +{
>> +=A0=A0=A0 phys_addr_t phys_addr;
>> +=A0=A0=A0 pte_t *ptep =3D memblock_alloc(PTRS_PER_PTE * sizeof(pte_t), =

>> PAGE_SIZE);
>> +
>> +=A0=A0=A0 do {
>> +=A0=A0=A0=A0=A0=A0=A0 phys_addr =3D memblock_phys_alloc(PAGE_SIZE, PAGE=
_SIZE);
>> +=A0=A0=A0=A0=A0=A0=A0 set_pte(ptep, pfn_pte(PFN_DOWN(phys_addr), PAGE_K=
ERNEL));
>> +=A0=A0=A0 } while (ptep++, vaddr +=3D PAGE_SIZE, vaddr !=3D end);
>> +
>> +=A0=A0=A0 set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(ptep)), PAGE_TABLE));
>> +}
>> +
>> +static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, =

>> unsigned long end)
>> +{
>> +=A0=A0=A0 phys_addr_t phys_addr;
>> +=A0=A0=A0 pmd_t *pmdp =3D memblock_alloc(PTRS_PER_PMD * sizeof(pmd_t), =

>> PAGE_SIZE);
>> +=A0=A0=A0 unsigned long next;
>> +
>> +=A0=A0=A0 do {
>> +=A0=A0=A0=A0=A0=A0=A0 next =3D pmd_addr_end(vaddr, end);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if (IS_ALIGNED(vaddr, PMD_SIZE) && (next - vaddr)=
 >=3D PMD_SIZE) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 phys_addr =3D memblock_phys_alloc(PMD=
_SIZE, PMD_SIZE);
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (phys_addr) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_pmd(pmdp, pfn_pmd(PFN=
_DOWN(phys_addr), =

>> PAGE_KERNEL));
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>> +=A0=A0=A0=A0=A0=A0=A0 }
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 kasan_populate_pte(pmdp, vaddr, end);
>> +=A0=A0=A0 } while (pmdp++, vaddr =3D next, vaddr !=3D end);
>> +
>> +=A0=A0=A0 /*
>> +=A0=A0=A0=A0 * Wait for the whole PGD to be populated before setting th=
e PGD in
>> +=A0=A0=A0=A0 * the page table, otherwise, if we did set the PGD before =

>> populating
>> +=A0=A0=A0=A0 * it entirely, memblock could allocate a page at a physica=
l address
>> +=A0=A0=A0=A0 * where KASAN is not populated yet and then we'd get a pag=
e fault.
>> +=A0=A0=A0=A0 */
>> +=A0=A0=A0 set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(pmdp)), PAGE_TABLE));
> =

> In case the PMD was filled entirely, PFN_DOWN(__pa(pmdp)) will point to =

> the next physical page, which is wrong. The same problem happens on the =

> other levels too.
> =

> I'll fix that in a v2 later today.
> =

> Alex
> =

>> +}
>> +
>> +static void kasan_populate_pgd(unsigned long vaddr, unsigned long end)
>> +{
>> +=A0=A0=A0 phys_addr_t phys_addr;
>> +=A0=A0=A0 pgd_t *pgdp =3D pgd_offset_k(vaddr);
>> +=A0=A0=A0 unsigned long next;
>> +
>> +=A0=A0=A0 do {
>> +=A0=A0=A0=A0=A0=A0=A0 next =3D pgd_addr_end(vaddr, end);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if (IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vadd=
r) >=3D =

>> PGDIR_SIZE) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 phys_addr =3D memblock_phys_alloc(PGD=
IR_SIZE, PGDIR_SIZE);
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (phys_addr) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_pgd(pgdp, pfn_pgd(PFN=
_DOWN(phys_addr), =

>> PAGE_KERNEL));
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>> +=A0=A0=A0=A0=A0=A0=A0 }
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 kasan_populate_pmd(pgdp, vaddr, end);
>> +=A0=A0=A0 } while (pgdp++, vaddr =3D next, vaddr !=3D end);
>> +}
>> +
>> +/*
>> + * This function populates KASAN shadow region focusing on hugepages in
>> + * order to minimize the page table cost and TLB usage too.
>> + * Note that start must be PGDIR_SIZE-aligned in SV39 which amounts =

>> to be
>> + * 1G aligned (that represents a 8G alignment constraint on virtual =

>> address
>> + * ranges because of KASAN_SHADOW_SCALE_SHIFT).
>> + */
>> +static void __init kasan_populate(void *start, void *end)
>> =A0 {
>> -=A0=A0=A0 unsigned long i, offset;
>> =A0=A0=A0=A0=A0 unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
>> =A0=A0=A0=A0=A0 unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
>> -=A0=A0=A0 unsigned long n_pages =3D (vend - vaddr) / PAGE_SIZE;
>> -=A0=A0=A0 unsigned long n_ptes =3D
>> -=A0=A0=A0=A0=A0=A0=A0 ((n_pages + PTRS_PER_PTE) & -PTRS_PER_PTE) / PTRS=
_PER_PTE;
>> -=A0=A0=A0 unsigned long n_pmds =3D
>> -=A0=A0=A0=A0=A0=A0=A0 ((n_ptes + PTRS_PER_PMD) & -PTRS_PER_PMD) / PTRS_=
PER_PMD;
>> -
>> -=A0=A0=A0 pte_t *pte =3D
>> -=A0=A0=A0=A0=A0=A0=A0 memblock_alloc(n_ptes * PTRS_PER_PTE * sizeof(pte=
_t), =

>> PAGE_SIZE);
>> -=A0=A0=A0 pmd_t *pmd =3D
>> -=A0=A0=A0=A0=A0=A0=A0 memblock_alloc(n_pmds * PTRS_PER_PMD * sizeof(pmd=
_t), =

>> PAGE_SIZE);
>> -=A0=A0=A0 pgd_t *pgd =3D pgd_offset_k(vaddr);
>> -
>> -=A0=A0=A0 for (i =3D 0; i < n_pages; i++) {
>> -=A0=A0=A0=A0=A0=A0=A0 phys_addr_t phys =3D memblock_phys_alloc(PAGE_SIZ=
E, PAGE_SIZE);
>> -=A0=A0=A0=A0=A0=A0=A0 set_pte(&pte[i], pfn_pte(PHYS_PFN(phys), PAGE_KER=
NEL));
>> -=A0=A0=A0 }
>> -
>> -=A0=A0=A0 for (i =3D 0, offset =3D 0; i < n_ptes; i++, offset +=3D PTRS=
_PER_PTE)
>> -=A0=A0=A0=A0=A0=A0=A0 set_pmd(&pmd[i],
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pfn_pmd(PFN_DOWN(__pa(&pte[offset])),
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __pgprot(_PAGE_TABLE)));
>> -=A0=A0=A0 for (i =3D 0, offset =3D 0; i < n_pmds; i++, offset +=3D PTRS=
_PER_PMD)
>> -=A0=A0=A0=A0=A0=A0=A0 set_pgd(&pgd[i],
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __pgprot(_PAGE_TABLE)));
>> +=A0=A0=A0 kasan_populate_pgd(vaddr, vend);
>> =A0=A0=A0=A0=A0 local_flush_tlb_all();
>> =A0=A0=A0=A0=A0 memset(start, 0, end - start);
>> @@ -99,7 +144,7 @@ void __init kasan_init(void)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (start >=3D end)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>> -=A0=A0=A0=A0=A0=A0=A0 populate(kasan_mem_to_shadow(start), kasan_mem_to=
_shadow(end));
>> +=A0=A0=A0=A0=A0=A0=A0 kasan_populate(kasan_mem_to_shadow(start), =

>> kasan_mem_to_shadow(end));
>> =A0=A0=A0=A0=A0 };
>> =A0=A0=A0=A0=A0 for (i =3D 0; i < PTRS_PER_PTE; i++)
>>

Palmer, you can drop this one as I split it and fixed it in my "Kasan =

improvements and fixes" series.

Thanks,

Alex

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
